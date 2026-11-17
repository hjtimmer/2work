(ns twoview.ws
  "Websocket-protocol. Alle communicatie verloopt via JSON-berichten
  over de websocket op /ws. Sessies: in-memory token met expiratie
  (ververst per database-actie). Gebruikers en tabelautorisaties
  komen uit de users-database.

  Entiteiten worden aangeduid met een unieke id (veld :tid), niet met
  de echte tabelnaam: bij het opstarten bouwt init-schema! een
  schema-atom (zie twoview.db/bouw-schema) waarmee de server ids
  vertaalt naar echte tabelnamen. De echte namen verlaten de server
  nooit; de client krijgt alleen ids en leesbare weergavenamen."
  (:require [org.httpkit.server :as http]
            [cheshire.core :as json]
            [twoview.db :as db]
            [twoview.users :as users]
            [twoview.sessie :as sessie]
            [clojure.string :as str]))

(defn- send! [ch m] (http/send! ch (json/generate-string m)))

;; Schema-atom, gevuld bij het opstarten van de server
;; (init-schema!, aangeroepen vanuit twoview.core). Vertaalt
;; entiteit-ids naar echte tabelnamen en omgekeerd.
(defonce schema (atom nil))

(defn init-schema!
  "Schema opbouwen en in het atom opslaan. Eén keer aanroepen bij het
  opstarten van de server."
  [ds]
  (reset! schema (db/bouw-schema ds))
  (println "[viewer] Schema geladen:"
           (count (:id->tabel @schema)) "entiteiten"))

(defn- tabel-van-id
  "De echte tabelnaam bij een entiteit-id, of nil bij een onbekende id."
  [tid]
  (get (:id->tabel @schema) tid))

(defn- id-van
  "De entiteit-id bij een echte tabelnaam, of nil."
  [tabel]
  (get (:tabel->id @schema) tabel))

(defn- entiteit-info
  "Client-weergave van een tabel: alleen de entiteit-id en de leesbare
  weergavenaam; de echte naam blijft serverzijde."
  [tabel]
  {:tid (id-van tabel) :scherm (db/schermnaam tabel)})

(defn- do-login [ch users-ds sessie-max {:keys [username password id]}]
  (if-let [user (users/check-login users-ds username password)]
    (send! ch {:type "login-ok" :id id
               :token (sessie/create! sessie-max username (:naam user))
               :naam (:naam user)})
    (send! ch {:type "login-fout" :id id
               :melding "Onjuiste gebruikersnaam of wachtwoord"})))

(defn- do-table
  "Rijen van een entiteit. :tid is de entiteit-id; de server lost die
  op tegen het schema. Het antwoord bevat ook :fk (kolom ->
  entiteit-id van het doel) zodat de client fk-koppelingen kan
  tonen zonder de echte tabelnamen te kennen."
  [ch ds {:keys [tid page q filters id]}]
  (when-let [tabel (tabel-van-id tid)]
    (let [result (db/select-rows ds tabel {:page page :q q :page-size 20
                                           :filters filters})]
      (send! ch {:type "table" :id id :tid tid
                 :scherm (get (:scherm @schema) tid)
                 :fk (get (:fk @schema) tabel)
                 :columns (mapv :name (db/table-columns ds tabel))
                 :pk (db/pk-kolom ds tabel)
                 :rows (:rows result)
                 :page (:page result)
                 :page-size (:page-size result)
                 :total (:total result)
                 :q q}))))

(defn- do-relaties
  "De aan een entiteit gerelateerde entiteiten (afgeleid uit
  kolomnamen, zoals beschreven in fk_afgeleid.md), gefilterd op de
  autorisatie van de gebruiker. Geeft ook de pk-kolom mee."
  [ch ds users-ds username {:keys [tid id]}]
  (when-let [tabel (tabel-van-id tid)]
    (let [toegestaan (set (users/tabellen-voor users-ds ds username))]
      (send! ch {:type "relaties" :id id :tid tid
                 :pk (db/pk-kolom ds tabel)
                 :relaties (vec (keep (fn [r]
                                        (when (contains? toegestaan (:tabel r))
                                          {:richting (:richting r)
                                           :tid (id-van (:tabel r))
                                           :scherm (db/schermnaam (:tabel r))
                                           :kolom (:kolom r)}))
                                      (db/fk-relaties ds tabel)))}))))

(defn- do-related
  "Rijen van de gerelateerde entiteiten horend bij een geselecteerde
  rij. richting \"van\":  rijen in de andere tabel waarvan de fk-kolom
  de pk-waarde van de geselecteerde rij bevat.
  richting \"naar\": de rij in de doeltabel die bij de kolomwaarde
  hoort. De gerelateerde tabellen worden in het antwoord aangeduid
  met hun entiteit-id en weergavenaam."
  [ch ds users-ds username {:keys [tid row-id id]}]
  (when-let [tabel (tabel-van-id tid)]
    (let [toegestaan (set (users/tabellen-voor users-ds ds username))
          pk      (db/pk-kolom ds tabel)
          rij     (db/find-row ds tabel pk row-id)
          pk-val  (get rij (keyword pk))
          rels    (->> (db/fk-relaties ds tabel)
                       (filter #(contains? toegestaan (:tabel %)))
                       (mapv (fn [{:keys [richting tabel kolom]}]
                               (let [rows (cond
                                            (nil? rij) []
                                            (= richting "van")
                                            (db/rijen-met-waarde ds tabel kolom pk-val 101 0)
                                            :else
                                            (when-let [v (get rij (keyword kolom))]
                                              (db/rijen-met-waarde ds tabel (db/pk-kolom ds tabel) v 101 0)))
                                     rijen (vec (take 100 (or rows [])))]
                                 {:richting richting
                                  :tid (id-van tabel)
                                  :scherm (db/schermnaam tabel)
                                  :kolom kolom
                                  :pk (db/pk-kolom ds tabel)
                                  :columns (mapv :name (db/table-columns ds tabel))
                                  :rows rijen
                                  :meer (> (count (or rows [])) 100)
                                  :vanaf (count rijen)}))))]
      (send! ch {:type "related" :id id :tid tid
                 :rij rij :relaties rels}))))

(defn- do-row [ch ds {:keys [tid row-id id]}]
  (when-let [tabel (tabel-van-id tid)]
    (send! ch {:type "row" :id id :tid tid
               :row (db/find-row ds tabel (db/pk-kolom ds tabel) row-id)})))

(defn- do-related-meer
  "Vervolgbatch rijen uit een gerelateerde entiteit (\"van\"-relatie)
  bij een geselecteerde rij. Batchgrootte 100. :doel is de
  entiteit-id van de gerelateerde tabel."
  [ch ds {:keys [tid row-id doel kolom offset id]}]
  (when-let [tabel (tabel-van-id tid)]
    (when-let [rtabel (tabel-van-id doel)]
      (let [pk     (db/pk-kolom ds tabel)
            rij    (db/find-row ds tabel pk row-id)
            pk-val (get rij (keyword pk))
            rows   (if (nil? pk-val)
                     []
                     (db/rijen-met-waarde ds rtabel kolom pk-val 101 (or offset 0)))
            rijen  (vec (take 100 rows))]
        (send! ch {:type "related-meer" :id id :tid doel :kolom kolom
                   :rows rijen
                   :meer (> (count rows) 100)
                   :offset (or offset 0)})))))

(def ^:private top-entiteiten
  "Entiteiten die als startpunt dienen (aangeduid met de echte
  tabelnaam; bij het opstarten vertaald naar entiteit-ids). Pas deze
  lijst aan om een ander startpunt te kiezen."
  ["dossier"])

(defn- do-tabellen
  "De entiteiten die de gebruiker mag zien, als ids met weergavenamen,
  plus het startpunt (:top, eveneens ids met weergavenamen)."
  [ch ds users-ds username {:keys [id]}]
  (let [tabellen (users/tabellen-voor users-ds ds username)
        gekozen  (filter (set tabellen) top-entiteiten)
        top      (if (seq gekozen)
                   (mapv entiteit-info gekozen)
                   (when-let [e (first tabellen)]
                     [(entiteit-info e)]))]
    (send! ch {:type "tables" :id id :user username
               :top (vec top)})))

(defn ws-handler [ds users-ds sessie-max]
  (fn [request]
    (http/with-channel request ch
      (http/on-close ch (fn [_status] nil))
      (http/on-receive
        ch
        (fn [data]
          (let [msg (try (json/parse-string data true) (catch Exception _ nil))]
            (when (map? msg)
              (let [action (:action msg)]
                (cond
                  (= action "login")
                  (do-login ch users-ds sessie-max msg)

                  ;; alle overige acties vereisen een geldige, niet
                  ;; verlopen sessie; check! ververs de expiratietijd
                  :else
                  (if-let [s (sessie/check! (:token msg))]
                    (let [username (:username s)
                          tabel     (tabel-van-id (:tid msg))
                          doel      (tabel-van-id (:doel msg))]
                      (cond
                        (= action "tables")
                        (do-tabellen ch ds users-ds username msg)

                        ;; entiteitacties: de id moet in het schema
                        ;; bestaan (de echte naam is dan per definitie
                        ;; geldig) en de gebruiker moet zijn
                        ;; geautoriseerd
                        (and (= action "table") tabel
                             (users/mag-tabel? users-ds username tabel))
                        (do-table ch ds msg)

                        (and (= action "row") tabel
                             (users/mag-tabel? users-ds username tabel))
                        (do-row ch ds msg)

                        (and (= action "relaties") tabel
                             (users/mag-tabel? users-ds username tabel))
                        (do-relaties ch ds users-ds username msg)

                        (and (= action "related") tabel
                             (users/mag-tabel? users-ds username tabel))
                        (do-related ch ds users-ds username msg)

                        (and (= action "related-meer") tabel doel
                             (users/mag-tabel? users-ds username tabel)
                             (users/mag-tabel? users-ds username doel))
                        (do-related-meer ch ds msg)

                        (= action "logout")
                        (do (sessie/delete! (:token msg))
                            (send! ch {:type "logout-ok" :id (:id msg)}))

                        :else
                        (send! ch {:type "fout" :id (:id msg)
                                   :melding (str "Onbekende actie of geen toegang: " action)})))
                    (send! ch {:type "fout" :id (:id msg)
                               :melding "Niet ingelogd of sessie verlopen"})))))))))))