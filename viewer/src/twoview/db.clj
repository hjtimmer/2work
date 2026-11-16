(ns twoview.db
  "Read-only database-toegang. Er worden uitsluitend SELECT-query's
  uitgevoerd; tabel- en kolomnamen worden gevalideerd tegen de
  werkelijke database zodat er geen SQL-injectie via identifiers kan."
  (:require [next.jdbc :as jdbc]
            [next.jdbc.result-set :as rs]))

(defn list-tables
  "Alle gebruikerstabellen (zonder sqlite-internes en zonder views)."
  [ds]
  (->> (jdbc/execute! ds ["SELECT name FROM sqlite_master
                           WHERE type = 'table'
                             AND name NOT LIKE 'sqlite_%'
                           ORDER BY name"]
                      {:builder-fn rs/as-unqualified-maps})
       (map :name)))

(defn table-exists? [ds table]
  (->> (list-tables ds) (some #(= % table)) boolean))

(defn table-columns
  "Kolommen van een tabel, zoals sqlite die kent: name, type, pk."
  [ds table]
  (jdbc/execute! ds ["PRAGMA table_info (?)" table]
                 {:builder-fn rs/as-unqualified-maps}))

(defn- valid-column? [ds table column]
  (->> (table-columns ds table)
       (some #(= column (:name %)))
       boolean))

(defn count-rows
  [ds table & [where-params]]
  (let [{:keys [where params]} (first where-params)
        sql (str "SELECT COUNT(*) AS n FROM \"" table "\" "
                 (when where (str "WHERE " where)))]
    (:n (first (jdbc/execute! ds (into [sql] params))))))

(defn select-rows
  "Paginering + optionele zoekterm. q filtert op alle kolommen
  (gecast naar tekst) met LIKE. Kolomnamen komen uit de database zelf,
  waarden worden als parameter meegegeven."
  [ds table {:keys [page q page-size]}]
  (let [cols  (table-columns ds table)
        page  (max 1 (or page 1))
        size  (or page-size 50)
        where (when (seq q)
                (str (->> (map #(str "CAST(\"" (:name %) "\" AS TEXT) LIKE ?") cols)
                          (clojure.string/join " OR "))))
        params (when (seq q) (repeat (count cols) (str "%" q "%")))
        sql    (str "SELECT * FROM \"" table "\" "
                    (when where (str "WHERE " where))
                    " LIMIT ? OFFSET ?")
        rows   (jdbc/execute! ds (into [sql] (concat params [size (* (dec page) size)]))
                              {:builder-fn rs/as-unqualified-maps})]
    {:rows rows
     :page page
     :page-size size
     :total (count-rows ds table (when where {:where where :params params}))}))

(defn find-row
  "Eén rij opzoeken op de primaire sleutel (of een opgegeven kolom)."
  [ds table pk-column id]
  (when (valid-column? ds table pk-column)
    (first (jdbc/execute! ds [(str "SELECT * FROM \"" table "\" WHERE \"" pk-column "\" = ? LIMIT 1") id]
                         {:builder-fn rs/as-unqualified-maps}))))
