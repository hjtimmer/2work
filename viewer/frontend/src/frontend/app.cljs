(ns frontend.app
  (:require [reagent.core :as r]
            [reagent.dom :as rdom]
            ["@material-ui/core" :as mui]
            ["@material-ui/icons" :as icons]
            [clojure.string :as str]))

(defonce state (r/atom {:token nil :naam nil :fout nil :tables [] :tabel nil
                        :data nil :zoek "" :geselecteerd nil :related nil :relaties-tonen false
                        :top [] :onder {}}))
(defonce ws (atom nil))
(defonce wachtend (atom {}))

(defn stuur [msg cb]
  (let [id (str (js/Math.random))]
    (swap! wachtend assoc id cb)
    (.send @ws (js/JSON.stringify (clj->js (assoc msg :id id))))))

(defn verbind []
  (let [socket (js/WebSocket. (str "ws://" js/location.host "/ws"))]
    (reset! ws socket)
    (set! (.-onmessage socket)
          (fn [e]
            (let [m (js->clj (js/JSON.parse (.-data e)) :keywordize-keys true)
                  cb (get @wachtend (:id m))]
              (when cb (swap! wachtend dissoc (:id m)) (cb m))
              (when (and (= (:type m) "fout") (not cb))
                (swap! state assoc :fout (:melding m))))))
    (set! (.-onclose socket)
          (fn [] (when (:token @state)
                   (swap! state assoc :token nil :fout "Verbinding verloren, opnieuw inloggen"))))))

(defn laad-tabellen []
  (stuur {:action "tables" :token (:token @state)}
         (fn [m]
           (swap! state assoc
                  :tables (:tables m)
                  :top (or (:top m) (:tables m))
                  ;; onderliggende keys komen als keywords binnen
                  ;; (js->clj :keywordize-keys), zet terug naar strings
                  :onder (into {} (map (fn [[k v]] [(name k) v]) (:onder m)))))))

(declare selecteer-rij)

(defn ga-naar-rij [naam id]
  (stuur {:action "table" :token (:token @state) :name naam :page 1 :q (str id)}
         (fn [m]
           (swap! state assoc :tabel naam :data m :zoek (str id)
                  :geselecteerd nil :related nil)
           (let [pk (get m :pk)]
             (when-let [rij (some #(when (= (str (get % (keyword pk))) (str id)) %)
                                  (get m :rows))]
               (selecteer-rij naam pk rij))))))

(defn laad-related [naam id]
  (stuur {:action "related" :token (:token @state) :name naam :row-id id}
         (fn [m] (swap! state assoc :related m))))

(defn laad-meer [naam id richting tabel kolom vanaf]
  (stuur {:action "related-meer" :token (:token @state) :name naam :row-id id
          :tabel tabel :kolom kolom :richting richting :offset vanaf}
         (fn [m]
           (swap! state update :related
                  (fn [rel]
                    (assoc rel :relaties
                           (mapv (fn [r]
                                   (if (and (= (:tabel r) tabel) (= (:kolom r) kolom))
                                     (assoc r :rows (into (:rows r) (:rows m))
                                            :meer (:meer m)
                                            :vanaf (+ vanaf (count (:rows m))))
                                     r))
                                 (:relaties rel))))))))

(defn selecteer-rij [naam pk rij]
  (let [id (get rij (keyword pk))]
    (if (= (:geselecteerd @state) id)
      (swap! state assoc :geselecteerd nil :related nil)
      (do
        (swap! state assoc :geselecteerd id :related nil)
        (when (:relaties-tonen @state)
          (laad-related naam id))))))

(defn toggle-relaties [naam]
  (let [nu (not (:relaties-tonen @state))]
    (swap! state assoc :relaties-tonen nu)
    (when (and nu (:geselecteerd @state))
      (laad-related naam (:geselecteerd @state)))))

(defn- text-field [label waarde on-change & {:keys [type input-props]}]
  [:> mui/TextField
   {:label label :value @waarde :fullWidth true :margin "normal"
    :type type
    :InputProps input-props
    :on-change (fn [e] (on-change (.. e -target -value)))}])

(defn login-view []
  (let [username (r/atom "")
        password (r/atom "")
        tonen    (r/atom false)]
    (fn []
      [:> mui/Container {:maxWidth "xs" :style {:marginTop 96}}
       [:> mui/Paper {:elevation 3 :style {:padding 32}}
        [:> mui/Typography {:variant "h5" :gutterBottom true} "2work viewer"]
        [:> mui/Typography {:variant "body2" :color "textSecondary" :gutterBottom true}
         "Log in om de database te bekijken"]
        (when (:fout @state)
          [:> mui/Typography {:color "error" :style {:margin "8px 0"}} (:fout @state)])
        [text-field "Gebruikersnaam" username #(reset! username %)]
        [text-field "Wachtwoord" password #(reset! password %)
         :type (if @tonen "text" "password")
         :input-props
         {:endAdornment
          (r/as-element
            [:> mui/InputAdornment {:position "end"}
             [:> mui/IconButton
              {:aria-label "wachtwoord tonen of verbergen"
               :on-click #(swap! tonen not)}
              (if @tonen [:> icons/VisibilityOff] [:> icons/Visibility])]])}]
        [:> mui/Button
         {:variant "contained" :color "primary" :fullWidth true
          :style {:marginTop 16}
          :on-click
          (fn []
            (stuur {:action "login" :username @username :password @password}
                   (fn [m]
                     (cond
                       (= (:type m) "login-ok")
                       (do (swap! state assoc :token (:token m) :naam (:naam m) :fout nil)
                           (laad-tabellen))
                       :else
                       (swap! state assoc :fout (:melding m))))))}
         "Inloggen"]]])))

(defn tabellen-view []
  [:> mui/Container {:maxWidth "md" :style {:marginTop 24}}
   [:> mui/Typography {:variant "h5"}
    (str "Welkom, " (or (:naam @state) ""))]
   ;; alleen de top-entiteiten; de overige tabellen zijn
   ;; bereikbaar via de gerelateerde panelen bij een geselecteerde rij
   [:> mui/List
    (for [t (:top @state)]
      ^{:key t}
      [:> mui/ListItem {:button true :on-click #(laad-tabel t)}
       [:> mui/ListItemIcon [:> icons/TableChart]]
       [:> mui/ListItemText {:primary t}]])]])

(defn- fk-link [kolom waarde]
  (let [lc (clojure.string/lower-case (name kolom))]
    (if (and (clojure.string/ends-with? lc "id") (> (count lc) 2)
             (some #(= (clojure.string/lower-case %)
                       (subs lc 0 (- (count lc) 2)))
                   (map clojure.string/lower-case (:tables @state))))
      [:> mui/Link
       {:href "#" :on-click #(do (.preventDefault %)
                                 (ga-naar-rij (subs lc 0 (- (count lc) 2)) waarde))
        :style {:cursor "pointer"}}
       (str waarde)]
      (str waarde))))

(defn- mini-tabel [columns rows on-click]
  [:> mui/Table {:size "small"}
   [:> mui/TableHead
    (into [:> mui/TableRow]
          (for [c columns]
                [:> mui/TableCell {:key c} (str c)]))]
   (into [:> mui/TableBody]
         (for [row rows]
           (into [:> mui/TableRow {:key (hash row) :hover true :on-click #(on-click row)}]
                 (for [c columns]
                       [:> mui/TableCell {:key c}
                        (let [v (get row (keyword c))]
                          (if (nil? v) "-" (str v)))]))))])

(defn- relatie-paneel [naam sel-id {:keys [richting tabel kolom columns rows pk meer vanaf]}]
  [:> mui/Accordion {:defaultExpanded true}
   [:> mui/AccordionSummary
    {:expand-icon (r/as-element [:> icons/ExpandMore])}
    [:> mui/Typography {:variant "subtitle2"}
     (str tabel " (" (count rows) ")")]]
   [:> mui/AccordionDetails {:style {:padding 0}}
    [mini-tabel columns rows
     #(ga-naar-rij tabel (str (get % (keyword pk))))]
    (when meer
      [:> mui/Button {:size "small" :style {:margin 8}
                      :on-click #(laad-meer naam sel-id richting tabel kolom vanaf)}
       "Meer laden"])]])

(defn- gerelateerd-view [naam sel-id]
  (let [related (:related @state)]
    [:div {:style {:marginTop 16}}
     [:> mui/Divider {:style {:marginBottom 8}}]
     (cond
       (nil? related)
       [:> mui/Typography {:color "textSecondary"}
        "Gerelateerde gegevens laden..."]
       (empty? (:relaties related))
       [:> mui/Typography {:color "textSecondary"}
        "Geen gerelateerde tabellen gevonden voor deze rij"]
       :else
       (for [r (:relaties related)]
         ^{:key (str (:richting r) "-" (:tabel r) "-" (:kolom r))}
         [relatie-paneel naam sel-id r]))]))

(defn tabel-view []
  (let [{:keys [columns rows page page-size total pk]} (:data @state)
        naam (:tabel @state)
        zoeken (r/cursor state [:zoek])]
    [:> mui/Container {:maxWidth "lg" :style {:marginTop 24}}
     [:> mui/Breadcrumbs {:style {:marginBottom 8}}
      [:> mui/Link {:href "#" :on-click #(do (.preventDefault %)
                                            (swap! state dissoc :tabel :data)
                                            (laad-tabellen))}
       "Tabellen"]
      [:> mui/Typography {:color "textPrimary"} naam]]
     [:> mui/Typography {:variant "h5" :gutterBottom true}
      (str naam " (" total " rijen)")]
     [:div {:style {:display "flex" :alignItems "flex-start" :marginTop 8}}
      [:> mui/TextField {:label "Zoeken in alle kolommen"
                         :value @zoeken
                         :margin "normal"
                         :style {:flex 1}
                         :on-change #(reset! zoeken (.. % -target -value))
                         :on-key-down #(when (= (.-key %) "Enter")
                                         (laad-tabel naam 1 @zoeken))}]
      [:> mui/Button {:variant "contained" :color "primary"
                      :style {:margin "16px 8px 0 8px"}
                      :on-click #(laad-tabel naam 1 @zoeken)}
       "Zoeken"]]
     [:> mui/FormControlLabel
      {:control (r/as-element
                 [:> mui/Checkbox
                  {:checked (boolean (:relaties-tonen @state))
                   :color "primary"
                   :on-change #(toggle-relaties naam)}])
       :label "Gerelateerde tabellen bij geselecteerde rij"}]
     [:> mui/TableContainer {:component mui/Paper}
      [:> mui/Table {:size "small" :stickyHeader true}
       [:> mui/TableHead
        (into [:> mui/TableRow]
              (for [c columns]
                [:> mui/TableCell {:key c} (str c)]))]
       (into [:> mui/TableBody]
             (for [row rows]
               (into [:> mui/TableRow
                      {:key (hash row)
                       :hover true
                       :selected (= (:geselecteerd @state) (get row (keyword pk)))
                       :on-click #(selecteer-rij naam pk row)}]
                     (for [c columns]
                       [:> mui/TableCell {:key c}
                        (let [v (get row (keyword c))]
                          (if (nil? v) "-" [fk-link c v]))]))))]]
     [:> mui/TablePagination
      {:component "div"
       :count total
       :page (dec page)
       :rows-per-page page-size
       :rows-per-page-options [20]
       :on-change-page (fn [_ p] (laad-tabel naam (inc p) @zoeken))}]
     (when (and (:relaties-tonen @state) (:geselecteerd @state))
       [gerelateerd-view naam (:geselecteerd @state)])]))


(defn app []
  (if-not (:token @state)
    [login-view]
    (if (:tabel @state)
      [tabel-view]
      [tabellen-view])))

(defn init []
  (verbind)
  (rdom/render [app] (js/document.getElementById "app")))
