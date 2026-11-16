(ns twoview.core
  "Startpunt van de 2work database-viewer.
  De configuratie wordt NIET uit de jar/resources gelezen maar van
  schijf, zodat hij buiten de applicatie onderhoudbaar is:

    1. pad opgegeven als eerste argument:  clj -M:run /etc/twoview/config.edn
    2. ./config.edn in de werkmap (typisch naast de jar)
    3. (noodfallback) resources/config.edn op het classpath

  Zet viewer/config.edn uit de repo naast de jar en pas de paden aan."
  (:require [clojure.edn :as edn]
            [clojure.java.io :as io]
            [next.jdbc :as jdbc]
            [org.httpkit.server :as http]
            [twoview.ws :as ws]
            [twoview.users :as users]))

(defn- read-edn [bron]
  (cond
    (instance? java.io.File bron) (edn/read-string (slurp bron))
    (instance? java.net.URL bron) (edn/read-string (slurp bron))
    :else (throw (ex-info "Onbekende configuratiebron" {:bron bron}))))

(defn load-config
  "Leest config.edn van schijf (argument of werkmap); valt alleen
  terug op het classpath als er geen bestand is gevonden."
  [& [pad]]
  (let [kandidaten (cond-> []
                     pad        (conj (io/file pad))
                     true       (conj (io/file "config.edn"))
                     true       (conj "config.edn"))] ;; resource
    (loop [[k & rest] kandidaten]
      (cond
        (nil? k)
        (throw (ex-info "config.edn niet gevonden: geef een pad op of zet config.edn in de werkmap" {}))

        (and (instance? java.io.File k) (.exists ^java.io.File k))
        (do (println "[viewer] Configuratie:" (.getAbsolutePath ^java.io.File k))
            (read-edn k))

        (and (instance? String k) (io/resource k))
        (do (println "[viewer] Waarschuwing: config.edn van classpath gebruikt;"
                     "verhuis hem naar de werkmap voor onderhoudbaarheid.")
            (read-edn (io/resource k)))

        :else (recur rest)))))

(defn index-response []
  {:status 200
   :headers {"Content-Type" "text/html; charset=utf-8"}
   :body (slurp (io/resource "public/index.html"))})

(defn -main [& args]
  (let [config   (apply load-config args)
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
