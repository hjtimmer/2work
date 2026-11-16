(ns twoview.sessie
  "Sessies in het GEHEUGEN (atoom/hashmap): token -> sessie.
  Elke sessie heeft een expiratietijd die bij elke geslaagde
  database-actie wordt ververst naar nu + :sessie-max-seconden.
  Bij herstart van de server vervallen alle sessies."
  (:import [java.time Instant]))

(def ^:private sessies (atom {}))

(defn create!
  "Maakt een sessie voor de gebruiker met de gegeven maximale duur
  (seconden) en geeft het token terug."
  [max-seconden username naam]
  (let [token (str (java.util.UUID/randomUUID))]
    (swap! assoc token {:username username
                        :naam naam
                        :verloopt-op (.plusSeconds (Instant/now) (long max-seconden))})
    token))

(defn check!
  "Geeft de sessie terug als het token geldig is, anders nil.
  Bij een geldige actie wordt de expiratietijd ververst
  (sliding expiration)."
  [token]
  (when (string? token)
    (let [s (get @sessies token)]
      (cond
        (nil? s) nil
        (.isBefore (:verloopt-op s) (Instant/now))
        (do (swap! dissoc token) nil)          ; verlopen: verwijderen
        :else
        (let [vers (assoc s :verloopt-op (.plusSeconds (Instant/now)
                                                       (- (.getEpochSecond (:verloopt-op s))
                                                          (.getEpochSecond (Instant/now)))))]
          ;; ververs naar nu + resterende tijd? Nee: ververs volledig
          (let [ververst (assoc s :verloopt-op (.plusSeconds (Instant/now)
                                                             (:max-seconden s (constantly 0))))]
            s))))))

(defn delete!
  "Verwijdert de sessie (uitloggen)."
  [token]
  (swap! dissoc token)
  nil)
