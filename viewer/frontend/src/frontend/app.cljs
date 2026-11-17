(ns frontend.app
  (:require [reagent.core :as r]
            [reagent.dom :as rdom]
            ["@material-ui/core" :as mui]
            ["@material-ui/icons" :as icons]
            [clojure.string :as str]))

(defonce state (r/atom {:token nil :naam nil :fout nil :tables [] :tabel nil
                        :data nil :zoek "" :geselecteerd nil :related nil :relaties-tonen false
                        :top [] :onder {} :filters []}))
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

(defn laad-tabel [tid & [page]]
  (let [filters (vec (remove #(str/blank? (str (:waarde %)))
                              (or (:filters @state) [])))]
    (stuur {:action "table" :token (:token @state) :tid tid
            :page (or page 1) :q "" :filters filters}
           (fn [m] (swap! state assoc :tabel tid :data m :zoek ""
                          :geselecteerd nil :related nil)))))

(defn laad-tabellen []
  ;; haalt de entiteitenlijst op (ids + weergavenamen; de echte
  ;; entiteitnamen kent alleen de server) en opent daarna direct
  ;; de eerste top-entiteit
  (stuur {:action "tables" :token (:token @state)}
         (fn [m]
           (swap! state assoc :top (:top m) :naam (:user m))
           (when-let [eerste (first (:top m))]
             (laad-tabel (:tid eerste))))))

(declare selecteer-rij)

(defn ga-naar-rij [tid waarde]
  (stuur {:action "table" :token (:token @state) :tid tid :page 1 :q (str waarde)}
         (fn [m]
           (swap! state assoc :tabel tid :data m :zoek (str waarde)
                  :geselecteerd nil :related nil :filters [])
           (let [pk (get m :pk)]
             (when-let [rij (some #(when (= (str (get % (keyword pk))) (str waarde)) %)
                                  (get m :rows))]
               (selecteer-rij tid pk rij))))))

(defn laad-related [tid rij-id]
  (stuur {:action "related" :token (:token @state) :tid tid :row-id rij-id}
         (fn [m] (swap! state assoc :related m))))

(defn laad-meer [tid rij-id richting doel kolom vanaf]
  (stuur {:action "related-meer" :token (:token @state) :tid tid :row-id rij-id
          :doel doel :kolom kolom :richting richting :offset vanaf}
         (fn [m]
           (swap! state update :related
                  (fn [rel]
                    (assoc rel :relaties
                           (mapv (fn [r]
                                   (if (and (= (:tid r) doel) (= (:kolom r) kolom))
                                     (assoc r :rows (into (:rows r) (:rows m))
                                            :meer (:meer m)
                                            :vanaf (+ vanaf (count (:rows m))))
                                     r))
                                 (:relaties rel))))))))

(defn selecteer-rij [tid pk rij]
  (let [id (get rij (keyword pk))]
    (if (= (:geselecteerd @state) id)
      (swap! state assoc :geselecteerd nil :related nil)
      (do
        (swap! state assoc :geselecteerd id :related nil)
        (when (:relaties-tonen @state)
          (laad-related tid id))))))

(defn toggle-relaties [tid]
  (let [nu (not (:relaties-tonen @state))]
    (swap! state assoc :relaties-tonen nu)
    (when (and nu (:geselecteerd @state))
      (laad-related tid (:geselecteerd @state)))))

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



(defn- fk-link [fk kolom waarde]
  ;; fk: door de server meegeleverde vertaaltabel
  ;; fk-kolom -> entiteit-id van het doel; de client kent de
  ;; echte tabelnamen niet
  (let [doel (get fk kolom)]
    (if doel
      [:> mui/Link
       {:href "#"
        :on-click #(do (.preventDefault %)
                       (ga-naar-rij doel waarde))
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

(defn- relatie-paneel [tid sel-id {:keys [richting doel scherm kolom columns rows pk meer vanaf]}]
  [:> mui/Accordion {:defaultExpanded true}
   [:> mui/AccordionSummary
    {:expand-icon (r/as-element [:> icons/ExpandMore])}
    [:> mui/Typography {:variant "subtitle2"}
     (str (or scherm doel) " (" (count rows) ")")]]
   [:> mui/AccordionDetails {:style {:padding 0}}
    [mini-tabel columns rows
     #(ga-naar-rij doel (str (get % (keyword pk))))]
    (when meer
      [:> mui/Button {:size "small" :style {:margin 8}
                      :on-click #(laad-meer tid sel-id richting doel kolom vanaf)}
       "Meer laden"])]])

(defn- gerelateerd-view [tid sel-id]
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
         [relatie-paneel tid sel-id r]))]))

(defn- filter-regel [tid columns i]
  (let [f   (get (:filters @state) i)
        upd (fn [k v] (swap! state assoc-in [:filters i k] v))
        wis #(swap! state update :filters
                    (fn [fs] (vec (keep-indexed (fn [j x] (when (not= j i) x))
                                               fs))))]
    [:div {:style {:display "flex" :alignItems "center" :flexWrap "wrap"
                   :marginTop 4}}
     [:> mui/NativeSelect {:value (or (:kolom f) "")
                           :style {:marginRight 8 :minWidth 160}
                           :on-change #(upd :kolom (.. % -target -value))}
      (for [c columns] ^{:key c} [:option {:value c} (str c)])]
     [:> mui/NativeSelect {:value (or (:op f) "=")
                           :style {:marginRight 8 :minWidth 80}
                           :on-change #(upd :op (.. % -target -value))}
      (for [o ["=" ">" "<" ">=" "<=" "%" "t/m"]]
        ^{:key o} [:option {:value o} o])]
     [:> mui/TextField {:label "Waarde" :value (or (:waarde f) "")
                        :style {:marginRight 8 :minWidth 140}
                        :on-change #(upd :waarde (.. % -target -value))
                        :on-key-down #(when (= (.-key %) "Enter")
                                        (laad-tabel tid 1))}]
     (when (= (:op f) "t/m")
       [:> mui/TextField {:label "t/m" :value (or (:tm f) "")
                          :style {:marginRight 8 :minWidth 100}
                          :on-change #(upd :tm (.. % -target -value))
                          :on-key-down #(when (= (.-key %) "Enter")
                                          (laad-tabel tid 1))}])
     [:> mui/IconButton {:on-click wis} [:> icons/Delete]]]))

(defn tabel-view []
  (let [{:keys [columns rows page page-size total pk scherm fk]} (:data @state)
        tid (:tabel @state)]
    [:> mui/Container {:maxWidth "lg" :style {:marginTop 24}}
     [:> mui/Breadcrumbs {:style {:marginBottom 8}}
      (when-let [top (first (:top @state))]
        [:> mui/Link {:href "#" :on-click #(do (.preventDefault %)
                                               (swap! state assoc :filters [])
                                               (laad-tabel (:tid top)))}
         (:scherm top)])
      [:> mui/Typography {:color "textPrimary"} (or scherm tid)]]
     [:> mui/Typography {:variant "h5" :gutterBottom true}
      (str (or scherm tid) " (" total " rijen)")]
     [:div {:style {:marginTop 8}}
      (for [i (range (count (:filters @state)))]
        ^{:key i}
        [filter-regel tid columns i])
      [:div {:style {:marginTop 8}}
       [:> mui/Button {:on-click #(swap! state update :filters conj
                                         {:kolom (or (first columns) "")
                                          :op "=" :waarde "" :tm ""})}
        "Filter toevoegen"]
       [:> mui/Button {:variant "contained" :color "primary"
                      :style {:margin "0 8px"}
                      :on-click #(laad-tabel tid 1)}
        "Zoeken"]
       [:> mui/Button {:on-click #(do (swap! state assoc :filters [])
                                      (laad-tabel tid 1))}
        "Filters wissen"]]]
     [:> mui/FormControlLabel
      {:control (r/as-element
                 [:> mui/Checkbox
                  {:checked (boolean (:relaties-tonen @state))
                   :color "primary"
                   :on-change #(toggle-relaties tid)}])
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
                       :on-click #(selecteer-rij tid pk row)}]
                     (for [c columns]
                       [:> mui/TableCell {:key c}
                        (let [v (get row (keyword c))]
                          (if (nil? v) "-" [fk-link fk c v]))]))))]]
     [:> mui/TablePagination
      {:component "div"
       :count total
       :page (dec page)
       :rows-per-page page-size
       :rows-per-page-options [20]
       :on-change-page (fn [_ p] (laad-tabel tid (inc p)))}]
     (when (and (:relaties-tonen @state) (:geselecteerd @state))
       [gerelateerd-view tid (:geselecteerd @state)])]))

(defn- laden-view []
  [:> mui/Container {:maxWidth "lg" :style {:marginTop 24}}
   [:> mui/Typography {:color "textSecondary"} "Gegevens laden..."]])

(defn app []
  (if-not (:token @state)
    [login-view]
    (if (:data @state)
      [tabel-view]
      [laden-view])))

(defn init []
  (verbind)
  (rdom/render [app] (js/document.getElementById "app")))
