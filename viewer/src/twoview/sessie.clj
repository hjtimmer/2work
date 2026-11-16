(ns twoview.sessie
  "Sessies in het GEHEUGEN (atoom/hashmap): token -> sessie.
  Elke sessie bewaart de maximale duur uit de config
  (:sessie-max-seconden). Bij elke geslaagde database-actie wordt de
  expiratietijd ververst naar nu + die maximale duur (sliding
  expiration). Bij herstart van de server vervallen alle sessies."
  (:import [java.time Instant]))

(def ^:private sessies (atom {}))

(defn create!
  "Maakt een sessie voor de gebruiker met de gegeven maximale duur
  (seconden) en geeft het token terug."
  [max-seconden username naam]
  (let [token (str (java.util.UUID/randomUUID))]
    (swap! assoc token
           {:username username
            :naam naam
            :max-seconden (long max-seconden)
            :verloopt-op (.plusSeconds (Instant/now) (long max-seconden))})
    token))

(defn check!
  "Geeft de sessie terug als het token geldig is, anders nil.
  Bij een geldige sessie wordt de expiratietijd ververst naar
  nu + de maximale duur van de sessie."
  [token]
  (when (string? token)
    (let [s (get @sessies token)]
      (cond
        (nil? s) nil

        ;; verlopen: sessie verwijderen en weigeren
        (.isBefore (:verloopt-op s) (Instant/now))
        (do (swap! dissoc token) nil)

        :else
        (do (swap! assoc token
                   (assoc s :verloopt-op (.plusSeconds (Instant/now) (:max-seconden s))))
            (get @sessies token))))))

(defn delete!
  "Verwijdert de sessie (uitloggen)."
  [token]
  (swap! dissoc token)
  nil)
