(ns frontend.app
  (:require [reagent.core :as r]
            [reagent.dom :as rdom]
            ["@material-ui/core" :as mui]
            ["@material-ui/icons" :as icons]
            [clojure.string :as str]))

(defonce state (r/atom {:token nil :naam nil :fout nil :tables [] :tabel nil :data nil :zoek ""}))
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
         (fn [m] (swap! state assoc :tables (:tables m)))))

(defn laad-tabel [naam & [page q]]
  (stuur {:action "table" :token (:token @state) :name naam
          :page (or page 1) :q (or q "")}
         (fn [m] (swap! state assoc :tabel naam :data m :zoek (:q m)))))

(defn ga-naar-rij [naam id]
  (stuur {:action "table" :token (:token @state) :name naam :page 1 :q (str id)}
         (fn [m] (swap! state assoc :tabel naam :data m :zoek (str id)))))

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
   [:> mui/Typography {:variant "h5"} (str "Welkom, " (or (:naam @state) ""))]
   [:> mui/List
    (for [t (:tables @state)]
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

(defn tabel-view []
  (let [{:keys [columns rows page page-size total]} (:data @state)
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
     [text-field "Zoeken in alle kolommen" zoeken
      #(do (reset! zoeken %)
           (when (or (empty? %) (> (count %) 1))
             (laad-tabel naam 1 %)))]
     [:> mui/TableContainer {:component mui/Paper}
      [:> mui/Table {:size "small" :stickyHeader true}
       [:> mui/TableHead
        (into [:> mui/TableRow]
              (for [c columns]
                [:> mui/TableCell {:key c} (str c)]))]
       (into [:> mui/TableBody]
             (for [row rows]
               (into [:> mui/TableRow {:key (hash row)}]
                     (for [c columns]
                       [:> mui/TableCell {:key c}
                        (let [v (get row (keyword c))]
                          (if (nil? v) "-" [fk-link c v]))]))))]]
     [:> mui/TablePagination
      {:component "div"
       :count total
       :page (dec page)
       :rows-per-page page-size
       :rows-per-page-options [50]
       :on-change-page (fn [_ p] (laad-tabel naam (inc p) @zoeken))}]]))

(defn app []
  (if-not (:token @state)
    [login-view]
    (if (:tabel @state)
      [tabel-view]
      [tabellen-view])))

(defn init []
  (verbind)
  (rdom/render [app] (js/document.getElementById "app")))
