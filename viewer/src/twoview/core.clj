(ns twoview.core
  "Startpunt van de 2work database-viewer.
  Leest resources/config.edn, opent de datasources (read-only
  gegevens + users-database met autorisaties) en start http-kit met
  het websocket-endpoint op /ws. Sessies blijven in het geheugen."
  (:require [clojure.edn :as edn]
            [clojure.java.io :as io]
            [next.jdbc :as jdbc]
            [org.httpkit.server :as http]
            [twoview.ws :as ws]
            [twoview.users :as users]))

(defn load-config
  []
  (or (when-let [res (io/resource "config.edn")]
        (edn/read-string (slurp res)))
      (throw (ex-info "config.edn niet gevonden op het classpath" {}))))

(defn index-response []
  {:status 200
   :headers {"Content-Type" "text/html; charset=utf-8"}
   :body (slurp (io/resource "public/index.html"))})

(defn -main [& _args]
  (let [config   (load-config)
        viewer   (:viewer config)
        db-url   (:database-url viewer)
        users-url (:users-database-url viewer)
        port     (or (:port viewer) 3000)
        sessie-max (or (:sessie-max-seconden viewer) 1800)
        _         (when-let [cert (:certificaat viewer)]
                    (println "[viewer] Certificaat geconfigureerd voor alias:" (:alias cert)))
        ds       (jdbc/get-datasource db-url)
        users-ds (jdbc/get-datasource users-url)]
    (users/init! users-ds)
    (users/seed! users-ds (:initiele-gebruikers viewer))
    (println "[viewer] Gegevens-database:" db-url)
    (println "[viewer] Users-database:" users-url)
    (println "[viewer] Sessie verloopt na" sessie-max "sec. inactiviteit (in het geheugen)")
    (println "[viewer] Websocket-server op poort" port)
    (http/run-server
      (fn [req]
        (if (:websocket? req)
          ((ws/ws-handler ds users-ds sessie-max) req)
          (if (= "/" (:uri req))
            (index-response)
            {:status 404 :body "Niet gevonden"})))
      {:port port})))
