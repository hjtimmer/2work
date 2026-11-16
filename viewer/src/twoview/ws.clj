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

(defn- pk-column [ds table]
  (let [cols (mapv :name (db/table-columns ds table))]
    (or (some #(when (= (str/lower-case (str %)) (str (str/lower-case table) "id")) %) cols)
        (first cols))))

(defn- do-login [ch users-ds sessie-max {:keys [username password id]}]
  (if-let [user (users/check-login users-ds username password)]
    (send! ch {:type "login-ok" :id id
               :token (sessie/create! sessie-max username (:naam user))
               :naam (:naam user)})
    (send! ch {:type "login-fout" :id id
               :melding "Onjuiste gebruikersnaam of wachtwoord"})))

(defn- do-table [ch ds {:keys [name page q id]}]
  (let [result (db/select-rows ds name {:page page :q q :page-size 50})]
    (send! ch {:type "table" :id id :name name
               :columns (mapv :name (db/table-columns ds name))
               :rows (:rows result)
               :page (:page result)
               :page-size (:page-size result)
               :total (:total result)
               :q q})))

(defn- do-row [ch ds {:keys [name row-id id]}]
  (send! ch {:type "row" :id id :name name
             :row (db/find-row ds name (pk-column ds name) row-id)}))

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
                        (send! ch {:type "tables" :id (:id msg) :user (:naam s)
                                   :tables (users/tabellen-voor users-ds ds username)})

                        ;; tabelacties: alleen binnen de autorisatie
                        (and (= action "table")
                             (db/table-exists? ds (:name msg))
                             (users/mag-tabel? users-ds username (:name msg)))
                        (do-table ch ds msg)

                        (and (= action "row")
                             (db/table-exists? ds (:name msg))
                             (users/mag-tabel? users-ds username (:name msg)))
                        (do-row ch ds msg)

                        (= action "logout")
                        (do (sessie/delete! (:token msg))
                            (send! ch {:type "logout-ok" :id (:id msg)}))

                        :else
                        (send! ch {:type "fout" :id (:id msg)
                                   :melding (str "Onbekende actie of geen toegang: " action)})))
                    (send! ch {:type "fout" :id (:id msg)
                               :melding "Niet ingelogd of sessie verlopen"}))))))))))))
