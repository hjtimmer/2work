(ns twoview.db
  "Read-only database-toegang. Er worden uitsluitend SELECT-query's
  uitgevoerd; tabel- en kolomnamen worden gevalideerd tegen de
  werkelijke database zodat er geen SQL-injectie via identifiers kan."
  (:require [next.jdbc :as jdbc]
            [next.jdbc.result-set :as rs]
            [clojure.string :as str]))

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
  "Kolommen van een tabel: name, type, pk.
  Merk op: via pragma_table_info als tabel-functie, want een directe
  PRAGMA-opdracht ondersteunt geen bind-parameters via JDBC."
  [ds table]
  (jdbc/execute! ds ["SELECT name, type, pk FROM pragma_table_info(?)"
                     table]
                 {:builder-fn rs/as-unqualified-maps}))

(defn pk-kolom
  "Primaire-sleutelkolom van een tabel: de kolom met de pk-vlag uit
  pragma_table_info, anders de kolom <tabel>id, anders de eerste kolom."
  [ds table]
  (let [cols (table-columns ds table)]
    (or (some #(when (pos? (long (or (:pk %) 0))) (:name %)) cols)
        (some #(when (= (str/lower-case (:name %))
                        (str (str/lower-case table) "id"))
                 (:name %)) cols)
        (:name (first cols)))))
(defn- valid-column? [ds table column]
  (->> (table-columns ds table)
       (some #(= column (:name %)))
       boolean))

(defn- kolom-type
  "SQL-type van een kolom (kleine letters), of een lege string."
  [ds table kolom]
  (->> (table-columns ds table)
       (some #(when (= kolom (:name %))
                (str/lower-case (str (:type %)))))
       (or "")))

(defn- numeriek-type?
  [type-str]
  (boolean (some #(str/includes? type-str %)
                 ["int" "real" "num" "dec" "floa" "doub"])))

(defn- filter-clause
  "SQL-fragment met parameters voor één kolomfilter. Numerieke
  vergelijking als de kolom een numeriek type heeft en de waarde er
  als getal uitziet, anders tekstuele vergelijking. Ongeldige
  kolommen of filters zonder waarde worden overgeslagen; kolommen
  zijn gevalideerd tegen het schema en waarden gaan als
  query-parameter, dus er is geen SQL-injectie mogelijk."
  [ds table {:keys [kolom op waarde tm]}]
  (when (and kolom (valid-column? ds table kolom)
             (not (str/blank? (str waarde))))
    (let [waarde (str waarde)
          num?   (and (re-matches #"-?\d+(\.\d+)?" waarde)
                      (numeriek-type? (kolom-type ds table kolom)))
          col    (if num?
                   (str "CAST(\"" kolom "\" AS REAL)")
                   (str "CAST(\"" kolom "\" AS TEXT)"))
          op     (or op "=")
          tm     (str tm)]
      (cond
        (= op "%")
        [(str col " LIKE ?") [(str "%" waarde "%")]]
        (and (= op "t/m") (not (str/blank? tm)))
        [(str col " BETWEEN ? AND ?") [waarde tm]]
        :else
        (case op
          "t/m" [(str col " = ?") [waarde]]
          ">"   [(str col " > ?") [waarde]]
          "<"   [(str col " < ?") [waarde]]
          ">="  [(str col " >= ?") [waarde]]
          "<="  [(str col " <= ?") [waarde]]
          "!="  [(str col " != ?") [waarde]]
          [(str col " = ?") [waarde]])))))

(defn count-rows
  [ds table & [where-params]]
  (let [{:keys [where params]} (first where-params)
        sql (str "SELECT COUNT(*) AS n FROM \"" table "\" "
                 (when where (str "WHERE " where)))]
    (:n (first (jdbc/execute! ds (into [sql] params))))))

(defn select-rows
  "Paginering + optionele zoekterm (q: LIKE over alle kolommen,
  OR-gekoppeld) + kolomfilters (AND-gekoppeld). Kolomnamen komen
  uit de database zelf, waarden gaan als parameters mee."
  [ds table {:keys [page q page-size filters]}]
  (let [cols  (table-columns ds table)
        page  (max 1 (or page 1))
        size  (or page-size 50)
        zoek  (when (and q (seq q))
                {:where (str/join " OR "
                                (map #(str "CAST(\"" (:name %) "\" AS TEXT) LIKE ?") cols))
                 :params (vec (repeat (count cols) (str "%" q "%")))})
        flts  (keep #(filter-clause ds table %) (or filters []))
        where-parts (concat (when zoek [(:where zoek)])
                            (map first flts))
        where (when (seq where-parts) (str/join " AND " where-parts))
        params (concat (when zoek (:params zoek)) (mapcat second flts))
        sql    (str "SELECT * FROM \"" table "\" "
                    (when where (str "WHERE " where))
                    " LIMIT ? OFFSET ?")
        rows   (jdbc/execute! ds (into [sql] (concat params
                                                   [size (* (dec page) size)]))
                              {:builder-fn rs/as-unqualified-maps})]
    {:rows rows
     :page page
     :page-size size
     :total (count-rows ds table (when where
                                   {:where where :params (vec params)}))}))

(defn find-row
  "Eén rij opzoeken op de (vermoede) primaire sleutel."
  [ds table pk-column id]
  (when (valid-column? ds table pk-column)
    (first (jdbc/execute! ds [(str "SELECT * FROM \"" table "\" WHERE \"" pk-column "\" = ? LIMIT 1") id]
                         {:builder-fn rs/as-unqualified-maps}))))

(defn rijen-met-waarde
  "Rijen uit een tabel waarvan de kolom (tekstueel vergeleken) gelijk
  is aan de gegeven waarde. Beperkt tot limit (standaard 100) rijen,
  met optionele offset voor vervolgbatches."
  [ds table column value & [limit offset]]
  (when (valid-column? ds table column)
    (jdbc/execute! ds [(str "SELECT * FROM \"" table "\" "
                            "WHERE CAST(\"" column "\" AS TEXT) = ? "
                            "LIMIT ? OFFSET ?")
                       (str value) (or limit 100) (or offset 0)]
                   {:builder-fn rs/as-unqualified-maps})))

(defn fk-hierarchie
  "Menuhiërarchie voor de tabellenlijst. Bovenliggende (top-)entiteiten
  zijn tabellen waarnaar door andere tabellen verwezen wordt (via de
  kolomnaamconventie), of tabellen zonder uitgaande verwijzingen.
  Alle overige tabellen (puur detail: ze verwijzen zelf ergens naar
  en niemand verwijst naar hen) komen onder de tabellen die ze
  verwijzen. Kolommen worden hier eenmalig per tabel opgehaald om
  niet per tabel opnieuw het hele schema te scannen."
  [ds tabellen]
  (let [tabellen  (vec (sort tabellen))
        lc->tabel  (zipmap (map str/lower-case tabellen) tabellen)
        kolommen   (zipmap tabellen
                              (map (fn [t] (mapv :name (table-columns ds t)))
                                   tabellen))
        ouders-van (fn [t]
                     (let [eigen (str (str/lower-case t) "id")]
                       (distinct
                        (keep (fn [c]
                                (let [lc (str/lower-case c)]
                                  (when (and (str/ends-with? lc "id")
                                             (> (count lc) 2)
                                             (not= lc eigen))
                                    (get lc->tabel
                                         (subs lc 0 (- (count lc) 2))))))
                              (get kolommen t)))))
        onder (reduce (fn [m t]
                       (reduce (fn [m p] (update m p (fnil conj []) t))
                               m
                               (ouders-van t)))
                     {}
                     tabellen)
        top (filter (fn [t] (or (seq (get onder t))
                                 (empty? (ouders-van t))))
                    tabellen)]
    {:top (vec top) :onder onder}))

(defn fk-relaties
  "Relaties van een tabel, afgeleid uit kolomnamen (het schema bevat
  geen expliciete FK-constraints; zie fk_afgeleid.md in de repo-root).
  Een kolom <tabel>id in deze tabel verwijst naar de tabel <tabel>
  (richting \"naar\"); een andere tabel met een kolom <deze-tabel>id
  verwijst naar deze tabel (richting \"van\")."
  [ds table]
  (let [tabellen (list-tables ds)
        lc->tabel (zipmap (map str/lower-case tabellen) tabellen)
        kolommen (mapv :name (table-columns ds table))
        eigen-pk (str (str/lower-case table) "id")
        uitgaand (keep (fn [c]
                         (let [lc (str/lower-case c)]
                           (when (and (str/ends-with? lc "id")
                                      (> (count lc) 2)
                                      (not= lc eigen-pk))
                             (when-let [t (get lc->tabel (subs lc 0 (- (count lc) 2)))]
                               {:richting "naar" :tabel t :kolom c}))))
                       kolommen)
        inkomend (mapcat (fn [t]
                           (let [fk (str (str/lower-case table) "id")]
                             (when-not (= t table)
                               (keep (fn [c]
                                       (when (= (str/lower-case c) fk)
                                         {:richting "van" :tabel t :kolom c}))
                                     (mapv :name (table-columns ds t))))))
                         tabellen)]
    (concat uitgaand inkomend)))
