(ns twoview.ws
  "Websocket-protocol. Alle communicatie (na het laden van de pagina)
  verloopt via JSON-berichten over de websocket op /ws.

  Client -> server:  {:action "login"     :username .. :password .. :id ..}
                     {:action "tables"    :token .. :id ..}
                     {:action "table"     :token .. :name .. :page .. :q .. :id ..}
                     {:action "row"       :token .. :name .. :id-veld .. :id ..}
                     {:action "logout"    :token .. :id ..}
  Server -> client:  {:type "login-ok" :token .. :naam .. :id ..}
                     {:type "tables" :tables [..]}
                     {:type "table" :name .. :columns [..] :rows [..] :page .. :total ..}
                     {:type "row" :name .. :row {..}}
                     {:type "fout" :melding ..}"
  (:require [org.httpkit.server :as http]
            [cheshire.core :as json]
            [twoview.db :as db]
            [twoview.sessie :as sessie]
            [clojure.string :as str]))

(defn- send! [ch m] (http/send! ch (json/generate-string m)))

(defn- user-for [sessie-ds token]
  (when token (sessie/lookup sessie-ds token)))

(defn- pk-column [ds table]
  (let [cols (mapv :name (db/table-columns ds table))]
    (or (some #(when (= (str/lower-case (str %)) (str (str/lower-case table) "id")) %) cols)
        (first cols))))

(defn- do-login [ch sessie-ds users {:keys [username password id]}]
  (let [u (get users username)]
    (if (and u (= (:password u) password))
      (send! ch {:type "login-ok" :id id
                 :token (sessie/create! sessie-ds username (:naam u))
                 :naam (:naam u)})
      (send! ch {:type "login-fout" :id id
                 :melding "Onjuiste gebruikersnaam of wachtwoord"}))))

(defn- do-table [ch ds {:keys [token id name page q]}]
  (let [result (db/select-rows ds name {:page page :q q :page-size 50})
        cols   (mapv :name (db/table-columns ds name))]
    (send! ch {:type "table" :id id :name name
               :columns cols
               :rows (:rows result)
               :page (:page result)
               :page-size (:page-size result)
               :total (:total result)
               :q q})))

(defn- do-row [ch ds {:keys [token id name row-id]}]
  (send! ch {:type "row" :id id :name name
             :row (db/find-row ds name (pk-column ds name) row-id)}))

(defn ws-handler [ds sessie-ds users]
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
                  (do-login ch sessie-ds users msg)

                  ;; alle overige acties vereisen een geldig token
                  :else
                  (if-let [user (user-for sessie-ds (:token msg))]
                    (cond
                      (= action "tables")
                      (send! ch {:type "tables" :id (:id msg) :user (:naam user)
                                 :tables (db/list-tables ds)})

                      (and (= action "table")
                           (db/table-exists? ds (:name msg)))
                      (do-table ch ds msg)

                      (and (= action "row")
                           (db/table-exists? ds (:name msg)))
                      (do-row ch ds msg)

                      (= action "logout")
                      (do (sessie/delete! sessie-ds (:token msg))
                          (send! ch {:type "logout-ok" :id (:id msg)}))

                      :else
                      (send! ch {:type "fout" :id (:id msg)
                                 :melding (str "Onbekende actie of tabel: " action)})))
                    (send! ch {:type "fout" :id (:id msg)
                               :melding "Niet ingelogd of token ongeldig"})))))))))))
