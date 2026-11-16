(ns twoview.handler
  "Routes en middleware: sessie-inlog, beveiligde read-only routes."
  (:require [reitit.ring :as reitit-ring]
            [ring.util.response :as response]
            [twoview.views :as views]
            [twoview.db :as db]
            [clojure.string :as str]))

(defn wrap-session
  "Simpel cookie-gebaseerd sessiebeheer."
  [handler]
  (fn [req]
    (let [session (or (:session req) {})
          user   (:user session)
          resp   (handler (assoc req :user user))]
      (if (contains? resp :session-change)
        (assoc-in resp [:headers "Set-Cookie"]
                  (str "twoview-session=" (:session-id (:session-change resp))
                       "; HttpOnly; SameSite=Lax; Path=/"))
        resp))))

(def ^:private sessions (atom #{}))

(defn login-post [users]
  (fn [{{:strs [username password]} :form-params}]
    (let [u (get users username)]
      (if (and u (= (:password u) password))
        (let [sid (str (java.util.UUID/randomUUID))]
          (swap! sessions conj sid)
          {:status 302
           :headers {"Set-Cookie" (str "twoview-session=" sid "; HttpOnly; SameSite=Lax; Path=/")
                     "Location" "/"}
           :user (assoc u :username username :session-id sid)}))
        {:status 200
         :body (views/login-page "Onjuiste gebruikersnaam of wachtwoord")}))))

(defn wrap-user
  "Zet de sessie om naar een :user op de request."
  [handler]
  (fn [req]
    (let [cookie (get-in req [:headers "cookie"] "")
          sid    (second (re-find #"twoview-session=([^;]+)" cookie))
          user   (get (:user-cache req) sid)]
      (handler (assoc req :user user)))))

(defn require-login
  "Middleware: stuur door naar /login als er geen gebruiker is."
  [handler]
  (fn [req]
    (if (:user req)
      (handler req)
      {:status 302 :headers {"Location" "/login"}})))

(defn- parse-long-safe [s] (try (Long/parseLong s) (catch Exception _ nil)))

(defn app
  "Bouwt de complete Ring-applicatie."
  [ds users]
  (let [logged-in (atom {})] ;; session-id -> user
    (reitit-ring/ring-handler
      (reitit-ring/router
        [["/login"
          {:get  (fn [_] {:status 200 :body (views/login-page)})
           :post (fn [req]
                   (let [resp ((login-post users) req)]
                     (when-let [u (:user resp)]
                       (swap! logged-in assoc (:session-id u) u))
                     (dissoc resp :user)))}]
         ["/logout"
          {:get (fn [req]
                  (let [cookie (get-in req [:headers "cookie"] "")
                        sid    (second (re-find #"twoview-session=([^;]+)" cookie))]
                    (swap! logged-in dissoc sid))
                  {:status 302 :headers {"Location" "/login"}})}]
         ["/" {:get {:middleware [require-login]}
           :get (fn [req] {:status 200 :body (views/tables-page ds (:user req))})}]
         ["/tables/:table"
          {:middleware [require-login]
           :get (fn [req]
                  (let [table (get-in req [:path-params :table])]
                    (if-not (db/table-exists? ds table)
                      {:status 404 :body "Onbekende tabel"}
                      (let [params (:query-params req)
                            q    (get params "q")
                            page (parse-long-safe (get params "page"))
                            id   (parse-long-safe (get params "id"))]
                        (if id
                          ;; focus op één rij via FK-link
                          (let [cols (mapv :name (db/table-columns ds table))
                                pk   (or (some #(when (= (clojure.string/lower-case (str %))
                                                          (str (clojure.string/lower-case table) "id")) %) cols)
                                         (first cols))
                                row  (db/find-row ds table pk id)]
                            {:status 200
                             :body (views/table-page ds (:user req) table
                                                     {:rows (when row [row])
                                                      :page 1 :page-size 1
                                                      :total (if row 1 0)
                                                      :q q :id id})})
                          {:status 200
                           :body (views/table-page ds (:user req) table
                                                   {:rows (:rows (db/select-rows ds table {:page page :q q}))
                                                    :page (:page (db/select-rows ds table {:page page :q q}))
                                                    :page-size 50
                                                    :total (:total (db/select-rows ds table {:page page :q q}))
                                                    :q q}))}))))}]])
      (reitit-ring/create-default-handler))))
