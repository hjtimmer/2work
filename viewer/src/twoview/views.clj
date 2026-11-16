(ns twoview.views
  "HTML-weergave met Hiccup: inlogscherm, tabellenlijst en tabelweergave."
  (:require [twoview.db :as db]
            [clojure.string :as str]))

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

(defn- header-bar [user]
  [:header
   [:strong "2work viewer"]
   [:span
    [:a {:href "/"} "Tabellen"] " — "
    (str "ingelogd als " (or (:naam user) (:username user) "gebruiker")) " — "
    [:a {:href "/logout"} "uitloggen"]]])

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

(defn- fk-target
  "Bepaalt op basis van de kolomnaamconventie (<Tabel>id) of de waarde
  een link moet worden naar de doeltabel. Geeft de doeltabelnaam of nil."
  [tables column-name]
  (let [c (str/lower-case (name column-name))]
    (when (and (str/ends-with? c "id") (> (count c) 2))
      (let [pref (subs c 0 (- (count c) 2))]
        (when (contains? tables pref) pref)))))

(defn- cell
  "Eén tabelcel; id-kolommen die naar een bestaande tabel verwijzen
  worden klikbare links naar de betreffende rij."
  [tables column-name value]
  (let [target (fk-target tables column-name)]
    (cond
      (nil? value) "—"
      target [:a.fk {:href (str "/tables/" target "?id=" value)} value]
      :else (str value))))

(defn tables-page [ds user]
  (let [tables (db/list-tables ds)]
    [:html
     [:head [:meta {:charset "utf-8"}] [:title "Tabellen"] [:style style]]
     [:body
      (header-bar user)
      [:main
       [:h1 "Tabellen (" (count tables) ")"]
       (into [:ul.tables]
             (for [t tables] [:li [:a {:href (str "/tables/" t)} t]]))]]]))

(defn table-page [ds user table {:keys [rows page page-size total q id]}]
  (let [cols      (mapv :name (db/table-columns ds table))
        tables    (set (map str/lower-case (db/list-tables ds)))
        last-page (max 1 (long (Math/ceil (/ total page-size))))
        qs        (when q (str "&q=" q))]
    [:html
     [:head [:meta {:charset "utf-8"}] [:title (str "Tabel " table)] [:style style]]
     [:body
      (header-bar user)
      [:main
       [:h1 "Tabel " table " (" total " rijen)"]
       (when id
         [:p "Rij #" id " in beeld — "
          [:a {:href (str "/tables/" table)} "filter wissen"]])
       [:form {:method "get" :action (str "/tables/" table)}
        [:input {:type "search" :name "q" :value (or q "")
                 :placeholder "Zoeken in alle kolommen..."}]
        [:button {:type "submit"} "Zoeken"]]
       [:table.data
        [:tr (for [c cols] [:th (str c)])]
        (for [row rows]
          [:tr (for [c cols]
                 [:td (cell tables c (get row (keyword c)))])])]
       [:p.pager
        (when (> page 1)
          [:a {:href (str "/tables/" table "?page=" (dec page) qs)} "« vorige"])
        [:span (str "pagina " page " van " last-page)]
        (when (< page last-page)
          [:a {:href (str "/tables/" table "?page=" (inc page) qs)} "volgende »"])]]]])))
