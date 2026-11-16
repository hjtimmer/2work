(ns twoview.core
  "Startpunt van de 2work database-viewer.
  Leest resources/config.edn, opent de databasedatasources (read-only
  gegevens + sessies) en start de http-kit server met een websocket
  endpoint op /ws."
  (:require [clojure.edn :as edn]
            [clojure.java.io :as io]
            [next.jdbc :as jdbc]
            [org.httpkit.server :as http]
            [twoview.ws :as ws]
            [twoview.sessie :as sessie]))

(defn load-config
  "Leest config.edn van het classpath."
  []
  (or (when-let [res (io/resource "config.edn")]
        (edn/read-string (slurp res)))
      (throw (ex-info "config.edn niet gevonden op het classpath" {}))))

(defn index-response []
  {:status 200
   :headers {"Content-Type" "text/html; charset=utf-8"}
   :body (slurp (io/resource "public/index.html"))})

(defn -main [& _args]
  (let [config  (load-config)
        viewer  (:viewer config)
        db-url  (:database-url viewer)
        sess-url (:or (:session-database-url viewer) "jdbc:sqlite:viewer_sessies.db")
        port    (or (:port viewer) 3000)
        users   (:users viewer)
        _       (when-let [cert (:certificaat viewer)]
                  (println "[viewer] Certificaat geconfigureerd voor alias:" (:alias cert)))
        ds      (jdbc/get-datasource db-url)
        sess-ds (jdbc/get-datasource sess-url)]
    (sessie/init! sess-ds)
    (println "[viewer] Gegevens-database:" db-url)
    (println "[viewer] Sessie-database:" sess-url)
    (println "[viewer] Websocket-server op poort" port)
    (http/run-server
      (fn [req]
        (if (:websocket? req)
          ((ws/ws-handler ds sess-ds users) req)
          (if (= "/" (:uri req))
            (index-response)
            {:status 404 :body "Niet gevonden"})))
      {:port port})))
