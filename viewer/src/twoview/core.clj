(ns twoview.core
  "Startpunt van de 2work database-viewer.
  De configuratie wordt van schijf gelezen (argument, werkmap of als
  noodfallback classpath). Serveert de SPA uit resources/public en
  het websocket-endpoint op /ws."
  (:require [clojure.edn :as edn]
            [clojure.java.io :as io]
            [next.jdbc :as jdbc]
            [org.httpkit.server :as http]
            [twoview.ws :as ws]
            [twoview.users :as users]
            [clojure.string :as str]))

(defn- read-edn [bron]
  (cond
    (instance? java.io.File bron) (edn/read-string (slurp bron))
    (instance? java.net.URL bron) (edn/read-string (slurp bron))
    :else (throw (ex-info "Onbekende configuratiebron" {:bron bron}))))

(defn load-config
  [& [pad]]
  (loop [[k & rest] (cond-> []
                      pad  (conj (io/file pad))
                      true (conj (io/file "config.edn"))
                      true (conj "config.edn"))]
    (cond
      (nil? k)
      (throw (ex-info "config.edn niet gevonden: geef een pad op of zet config.edn in de werkmap" {}))

      (and (instance? java.io.File k) (.exists ^java.io.File k))
      (do (println "[viewer] Configuratie:" (.getAbsolutePath ^java.io.File k))
          (read-edn k))

      (and (instance? String k) (io/resource k))
      (do (println "[viewer] Waarschuwing: config.edn van classpath gebruikt;")
          (read-edn (io/resource k)))

      :else (recur rest))))

(def ^:private content-types
  {".html" "text/html; charset=utf-8"
   ".js"   "application/javascript; charset=utf-8"
   ".css"  "text/css"})

(defn- extensie [uri]
  (or (re-find #"[.][^.]+$" uri) ""))

(defn- static-response [uri]
  (if-let [res (io/resource (str "public" uri))]
    {:status 200
     :headers {"Content-Type" (get content-types (extensie uri)
                                   "application/octet-stream")}
     :body (slurp res)}
    {:status 404 :body "Niet gevonden"}))

(defn index-response []
  (static-response "/index.html"))

(defn -main [& args]
  (let [config     (apply load-config args)
        viewer     (:viewer config)
        db-url     (:database-url viewer)
        users-url  (:users-database-url viewer)
        port       (or (:port viewer) 3000)
        sessie-max (or (:sessie-max-seconden viewer) 1800)
        _          (when-let [cert (:certificaat viewer)]
                     (println "[viewer] Certificaat geconfigureerd voor alias:" (:alias cert)))
        ds         (jdbc/get-datasource db-url)
        users-ds   (jdbc/get-datasource users-url)]
    (users/init! users-ds)
    (users/seed! users-ds (:initiele-gebruikers viewer))
    (ws/init-schema! ds)
    (println "[viewer] Gegevens-database:" db-url)
    (println "[viewer] Users-database:" users-url)
    (println "[viewer] Sessie verloopt na" sessie-max "sec. inactiviteit (in het geheugen)")
    (println "[viewer] Websocket-server op poort" port)
    (http/run-server
      (fn [req]
        (cond
          (:websocket? req) ((ws/ws-handler ds users-ds sessie-max) req)
          (= "/" (:uri req)) (index-response)
          (str/starts-with? (:uri req) "/js/") (static-response (:uri req))
          :else {:status 404 :body "Niet gevonden"}))
      {:port port})))
