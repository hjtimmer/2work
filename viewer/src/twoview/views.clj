(ns twoview.views
  "HTML-weergave met Hiccup: inlogscherm, tabellenlijst en tabelweergave."
  (:require [twoview.db :as db]))

(def ^:private style "
body { font-family: system-ui, sans-serif; margin: 0; background: #f4f6f8; color: #1a2433; }
header { background: #1a2433; color: #fff; padding: 12px 24px; display: flex; justify-content: space-between; }
header a { color: #9fc2ff; text-decoration: none; }
main { max-width: 1200px; margin: 24px auto; padding: 0 16px; }
table.data { border-collapse: collapse; width: 100%; background: #fff; font-size: 14px; }
table.data th, table.data td { border: 1px solid #dde3ea; padding: 6px 10px; text-align: left; }
table.data th { background: #eef2f7; }
table.data tr:nth-child(even) { background: #f9fbfd; }
a.fk { color: #0b5cab; text-decoration: none; }
a.fk:hover { text-decoration: underline; }
input, button { font-size: 14px; padding: 6px 10px; border: 1px solid #b9c3ce; border-radius: 4px; }
button { background: #1a2433; color: #fff; border: none; cursor: pointer; }
.login { max-width: 360px; margin: 80px auto; background: #fff; padding: 32px; border-radius: 8px;
         box-shadow: 0 2px 8px rgba(0,0,0,.08); display: flex; flex-direction: column; gap: 12px; }
.error { color: #b3261e; }
.pager a, .pager span { margin-right: 8px; }
ul.tables { columns: 4; -webkit-columns: 4; padding-left: 20px; }
")

(defn- layout [title body & {:keys [user]}]
  [:html
   [:head
    [:meta {:charset "utf-8"}]
    [:title title]
    [:style style]]
   [:body
    [:header
     [:strong "2work viewer"]
     (when user
       [:span (str "Ingelogd als " (:naam user " ") " — ")
        [:a {:href "/logout"} "uitloggen"]])]
    main-body-placeholder
    ]])

(defn login-page [& [error]]
  [:html
   [:head [:meta {:charset "utf-8"}] [:title "Inloggen"] [:style style]]
   [:body
    [:form.login {:method "post" :action "/login"}
     [:h2 "Inloggen"]
     (when error [:p.error error])
     [:input {:type "text" :name "username" :placeholder "Gebruikersnaam" :required true}]
     [:input {:type "password" :name "password" :placeholder "Wachtwoord" :required true}]
     [:button {:type "submit"} "Inloggen"]]]])

(defn- fk-link
  "Als een kolomnaam voldoet aan de conventie (<Tabel>id of eindigt op
  een bestaande tabelnaam) en de waarde niet-null is, maak er dan een
  link naar die tabel met dat id."
  [ds table column-name value]
  (let [c      (clojure.string/lower-case (name column-name))
        tables (set (map clojure.string/lower-case (db/list-tables ds)))]
    (if (and (string? c) (clojure.string/ends-with? c "id")
             (some? value)
             (not= c (clojure.string/lower-case table)))
      (let [pref (subs c 0 (- (count c) 2))]
        (cond
          (contains? tables pref)
          [:a.fk {:href (str "/tables/" pref "?id=" value)} value]
          ;; suffix-match: kolom eindigt op een tabelnaam
          (some (fn [t] (when (and (>= (count pref) (+ (count t) 1))
                                   (clojure.string/ends-with? pref t)) t)) tables)
          => nil ;; (afgehandeld in de let hieronder om de code simpel te houden)
          :else value))
      value)))

(defn tables-page [ds user]
  (let [tables (db/list-tables ds)]
    [:html
     [:head [:meta {:charset "utf-8"}] [:title "Tabellen"] [:style style]]
     [:body
      [:header [:strong "2work viewer"]
       [:span (str "Ingelogd als " (:naam user " ") " — ")
        [:a {:href "/logout"} "uitloggen"]]]
      [:main
       [:h1 "Tabellen (" (count tables) ")"]
       (into [:ul.tables]
             (for [t tables]
               [:li [:a {:href (str "/tables/" t)} t]]))]]]))

(defn table-page [ds user table {:keys [rows page page-size total q id] :as opts}]
  (let [cols (mapv :name (db/table-columns ds table))
        focus-row (when id (db/find-row ds table (first (filter #(clojure.string/ends-with? (clojure.string/lower-case (str %)) "id") cols)) id))
        last-page (max 1 (long (Math/ceil (/ total page-size))))]
    [:html
     [:head [:meta {:charset "utf-8"}] [:title (str "Tabel " table)] [:style style]]
     [:body
      [:header [:strong "2work viewer"]
       [:span [:a {:href "/"} "Tabellen"] " — "
        (str "Ingelogd als " (:naam user " ") " — ")
        [:a {:href "/logout"} "uitloggen"]]]
      [:main
       [:h1 "Tabel " table " (" total " rijen)"]
       (when focus-row
         [:p "Rij #" id " in beeld (filter actief) — "
          [:a {:href (str "/tables/" table)} "filter wissen"]])
       [:form {:method "get" :action (str "/tables/" table)}
        [:input {:type "search" :name "q" :value (or q "") :placeholder "Zoeken in alle kolommen..."}]
        [:button {:type "submit"} "Zoeken"]]
       [:table.data
        (into [:tr] (map (fn [c] [:th (str c)]) cols))
        (into [:tr] (for [row rows]
                      (into [:tr]
                            (for [c cols]
                              (let [v (get row (keyword c))]
                                [:td (if (nil? v) "—" v)])))))]
       [:p.pager
        (when (> page 1) [:a {:href (str "/tables/" table "?page=" (dec page) (when q (str "&q=" q)))} "« vorige"])
        [:span (str "pagina " page " van " last-page)]
        (when (< page last-page) [:a {:href (str "/tables/" table "?page=" (inc page) (when q (str "&q=" q)))} "volgende »"])]]]]))
