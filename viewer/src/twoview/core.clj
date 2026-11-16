(ns twoview.core
  "Startpunt van de 2work database-viewer.
  Leest resources/config.edn, maakt een JDBC-datasource en start Jetty."
  (:require [clojure.edn :as edn]
            [clojure.java.io :as io]
            [next.jdbc :as jdbc]
            [ring.adapter.jetty :refer [run-jetty]]
            [twoview.handler :as handler]))

(defn load-config
  "Leest config.edn uit de classpath (resources/) of van schijf."
  []
  (or (when-let [res (io/resource "config.edn")]
        (edn/read-string (slurp res)))
      (throw (ex-info "config.edn niet gevonden op het classpath" {}))))

(defn certificaat-info
  "Geeft de certificaat-instellingen uit de config terug.
  Voorlopig alleen beschikbaar; hier kan later het laden van een
  keystore / client-certificaat mee geimplementeerd worden."
  [{:keys [certificaat]}]
  (when certificaat
    (println "[viewer] Certificaat geconfigureerd voor alias:" (:alias certificaat)))
  certificaat)

(defn -main [& _args]
  (let [config   (load-config)
        viewer   (:viewer config)
        db-url   (:database-url viewer)
        port     (or (:port viewer) 3000)
        _        (certificaat-info viewer)
        ds       (jdbc/get-datasource db-url)]
    (println "[viewer] Verbinden met database:" db-url)
    (println "[viewer] Server starten op poort" port)
    (run-jetty (handler/app ds (:users viewer))
               {:port port :join? true})))
