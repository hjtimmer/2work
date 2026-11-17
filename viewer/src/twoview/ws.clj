(ns twoview.ws
  "Websocket-protocol. Alle communicatie verloopt via JSON-berichten
  over de websocket op /ws. Sessies: in-memory token met expiratie
  (ververst per database-actie). Gebruikers en tabelautorisaties
  komen uit de users-database."
  (:require [org.httpkit.server :as http]
            [cheshire.core :as json]
            [twoview.db :as db]
            [twoview.users :as users]
            [twoview.sessie :as sessie]
            [clojure.string :as str]))

(defn- send! [ch m] (http/send! ch (json/generate-string m)))

(defn- do-login [ch users-ds sessie-max {:keys [username password id]}]
  (if-let [user (users/check-login users-ds username password)]
    (send! ch {:type "login-ok" :id id
               :token (sessie/create! sessie-max username (:naam user))
               :naam (:naam user)})
    (send! ch {:type "login-fout" :id id
               :melding "Onjuiste gebruikersnaam of wachtwoord"})))

(defn- do-table [ch ds {:keys [name page q filters id]}]
  (let [result (db/select-rows ds name {:page page :q q :page-size 20
                                               :filters filters})]
    (send! ch {:type "table" :id id :name name
               :columns (mapv :name (db/table-columns ds name))
               :pk (db/pk-kolom ds name)
               :rows (:rows result)
               :page (:page result)
               :page-size (:page-size result)
               :total (:total result)
               :q q})))

(defn- do-relaties
  "De aan een tabel gerelateerde tabellen (afgeleid uit kolomnamen,
  zoals beschreven in fk_afgeleid.md), gefilterd op de autorisatie
  van de gebruiker. Geeft ook de pk-kolom mee."
  [ch ds users-ds username {:keys [name id]}]
  (let [toegestaan (set (users/tabellen-voor users-ds ds username))]
    (send! ch {:type "relaties" :id id :name name
               :pk (db/pk-kolom ds name)
               :relaties (vec (filter #(contains? toegestaan (:tabel %))
                                      (db/fk-relaties ds name)))})))

(defn- do-related
  "Rijen van de gerelateerde tabellen horend bij een geselecteerde rij.
  richting \"van\":  rijen in de andere tabel waarvan de fk-kolom de
  pk-waarde van de geselecteerde rij bevat.
  richting \"naar\": de rij in de doeltabel die bij de kolomwaarde hoort."
  [ch ds users-ds username {:keys [name row-id id]}]
  (let [toegestaan (set (users/tabellen-voor users-ds ds username))
        pk      (db/pk-kolom ds name)
        rij     (db/find-row ds name pk row-id)
        pk-val  (get rij (keyword pk))
        rels    (->> (db/fk-relaties ds name)
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
                               {:richting richting :tabel tabel :kolom kolom
                                :pk (db/pk-kolom ds tabel)
                                :columns (mapv :name (db/table-columns ds tabel))
                                :rows rijen
                                :meer (> (count (or rows [])) 100)
                                :vanaf (count rijen)}))))]

    (send! ch {:type "related" :id id :name name
               :rij rij :relaties rels})))

(defn- do-row [ch ds {:keys [name row-id id]}]
  (send! ch {:type "row" :id id :name name
             :row (db/find-row ds name (db/pk-kolom ds name) row-id)}))

(defn- do-related-meer
  "Vervolgbatch rijen uit een gerelateerde tabel (\"van\"-relatie)
  bij een geselecteerde rij. Batchgrootte 100."
  [ch ds {:keys [name row-id tabel kolom offset id]}]
  (let [pk     (db/pk-kolom ds name)
        rij    (db/find-row ds name pk row-id)
        pk-val (get rij (keyword pk))
        rows   (if (nil? pk-val)
                 []
                 (db/rijen-met-waarde ds tabel kolom pk-val 101 (or offset 0)))
        rijen  (vec (take 100 rows))]
    (send! ch {:type "related-meer" :id id :tabel tabel :kolom kolom
               :rows rijen
               :meer (> (count rows) 100)
               :offset (or offset 0)})))

(def ^:private top-entiteiten
  "Entiteiten die in het menu verschijnen. De overige tabellen zijn
  bereikbaar via de gerelateerde panelen bij een geselecteerde rij
  (en via de FK-links in de tabelcellen). Pas deze lijst aan om
  andere entiteiten aan het menu toe te voegen."
  ["DOSSIER"])

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
                    (let [username (:username s)]
                      (cond
                        (= action "tables")
                        (let [tabellen (users/tabellen-voor users-ds ds username)
                              hier (db/fk-hierarchie ds tabellen)
                              gekozen (seq (filter (set tabellen) top-entiteiten))]
                          (send! ch {:type "tables" :id (:id msg) :user (:naam s)
                                     :tables tabellen
                                     :top (if gekozen (vec gekozen) (:top hier))
                                     :onder (:onder hier)}))

                        ;; tabelacties: alleen binnen de autorisatie
                        (and (= action "table")
                             (db/table-exists? ds (:name msg))
                             (users/mag-tabel? users-ds username (:name msg)))
                        (do-table ch ds msg)

                        (and (= action "row")
                             (db/table-exists? ds (:name msg))
                             (users/mag-tabel? users-ds username (:name msg)))
                        (do-row ch ds msg)

                        (and (= action "relaties")
                             (db/table-exists? ds (:name msg))
                             (users/mag-tabel? users-ds username (:name msg)))
                        (do-relaties ch ds users-ds username msg)

                        (and (= action "related")
                             (db/table-exists? ds (:name msg))
                             (users/mag-tabel? users-ds username (:name msg)))
                        (do-related ch ds users-ds username msg)

                        (and (= action "related-meer")
                             (db/table-exists? ds (:name msg))
                             (db/table-exists? ds (:tabel msg))
                             (users/mag-tabel? users-ds username (:name msg))
                             (users/mag-tabel? users-ds username (:tabel msg)))
                        (do-related-meer ch ds msg)

                        (= action "logout")
                        (do (sessie/delete! (:token msg))
                            (send! ch {:type "logout-ok" :id (:id msg)}))

                        :else
                        (send! ch {:type "fout" :id (:id msg)
                                   :melding (str "Onbekende actie of geen toegang: " action)})))
                    (send! ch {:type "fout" :id (:id msg)
                               :melding "Niet ingelogd of sessie verlopen"})))))))))))
