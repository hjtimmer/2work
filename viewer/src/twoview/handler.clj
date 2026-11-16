(ns twoview.handler
  "Routes en middleware: sessie-inlog, beveiligde read-only routes."
  (:require [reitit.ring :as reitit-ring]
            [twoview.views :as views]
            [twoview.db :as db]
            [clojure.string :as str]))

(def ^:private sessions (atom {})) ;; session-id -> user

(defn- session-id-from [req]
  (let [cookie (get-in req [:headers "cookie"] "")]
    (second (re-find #"twoview-session=([^;]+)" cookie))))

(defn wrap-user
  "Zet de sessie-cookie om naar een :user op de request."
  [handler]
  (fn [req]
    (handler (assoc req :user (get @sessions (session-id-from req))))))

(defn require-login
  "Middleware: stuur door naar /login als er geen gebruiker ingelogd is."
  [handler]
  (fn [req]
    (if (:user req)
      (handler req)
      {:status 302 :headers {"Location" "/login"}})))

(defn login-post [users]
  (fn [{{:strs [username password]} :form-params}]
    (let [u (get users username)]
      (if (and u (= (:password u) password))
        (let [sid (str (java.util.UUID/randomUUID))]
          (swap! sessions assoc sid (assoc u :username username))
          {:status 302
           :headers {"Set-Cookie" (str "twoview-session=" sid "; HttpOnly; SameSite=Lax; Path=/")
                     "Location" "/"}})
        {:status 200 :body (views/login-page "Onjuiste gebruikersnaam of wachtwoord")}))))

(defn- parse-long-safe [s] (try (Long/parseLong s) (catch Exception _ nil)))

(defn- pk-column [ds table]
  (let [cols (mapv :name (db/table-columns ds table))]
    (or (some #(when (= (str/lower-case (str %)) (str (str/lower-case table) "id")) %) cols)
        (first cols))))

(defn- focus-page [ds user table id]
  (let [pk  (pk-column ds table)
        row (db/find-row ds table pk id)]
    {:status 200
     :body (views/table-page ds user table
                             {:rows (if row [row] [])
                              :page 1 :page-size 1
                              :total (if row 1 0) :id id})}))

(defn- browse-page [ds user table q page]
  (let [result (db/select-rows ds table {:page page :q q :page-size 50})]
    {:status 200
     :body (views/table-page ds user table
                            {:rows (:rows result)
                             :page (:page result)
                             :page-size (:page-size result)
                             :total (:total result)
                             :q q})}))

(defn app
  "Bouwt de complete Ring-applicatie. wrap-user geldt router-breed,
  require-login beveiligt de tabelroutes."
  [ds users]
  (reitit-ring/ring-handler
    (reitit-ring/router
      [["/login"
        {:get  (fn [_] {:status 200 :body (views/login-page)})
         :post (login-post users)}]
       ["/logout"
        {:get (fn [req]
                (swap! sessions dissoc (session-id-from req))
                {:status 302 :headers {"Location" "/login"}})}]
       ["/" {:get (fn [req]
                    (if (:user req)
                      {:status 200 :body (views/tables-page ds (:user req))}
                      {:status 302 :headers {"Location" "/login"}}))}]
       ["/tables/:table"
        {:middleware [require-login]
         :get (fn [req]
                (let [table  (get-in req [:path-params :table])
                      params (:query-params req)
                      q    (get params "q")
                      page (parse-long-safe (get params "page"))
                      id   (parse-long-safe (get params "id"))]
                  (if-not (db/table-exists? ds table)
                    {:status 404 :body "Onbekende tabel"}
                    (if id
                      (focus-page ds (:user req) table id)
                      (browse-page ds (:user req) table q page)))))}]]
      {:data {:middleware [wrap-user]}})
    (reitit-ring/create-default-handler)))
