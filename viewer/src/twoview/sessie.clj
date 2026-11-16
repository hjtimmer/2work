(ns twoview.sessie
  "Sessies met token. De server bewaart elk uitgegeven token in de
  tabel viewer_sessie (aparte sessie-database, zodat de
  gegevens-database puur read-only blijft). De client krijgt het
  token terug en stuurt het bij elke actie mee; er is geen cookie."
  (:require [next.jdbc :as jdbc]
            [next.jdbc.result-set :as rs]))

(defn init!
  "Maakt de sessietabel aan als die nog niet bestaat."
  [ds]
  (jdbc/execute! ds ["CREATE TABLE IF NOT EXISTS viewer_sessie (
    token            TEXT PRIMARY KEY,
    username         TEXT NOT NULL,
    naam             TEXT,
    aangemaakt       TEXT NOT NULL,
    laatst_gebruikt  TEXT NOT NULL)"]))

(defn- nu [] (str (java.time.Instant/now)))

(defn create!
  "Logt een gebruiker in: maakt een vers token aan in de sessietabel
  en geeft het token terug."
  [ds username naam]
  (let [token (str (java.util.UUID/randomUUID))]
    (jdbc/execute! ds ["INSERT INTO viewer_sessie
                         (token, username, naam, aangemaakt, laatst_gebruikt)
                         VALUES (?, ?, ?, ?, ?)"
                        token username naam (nu) (nu)])
    token))

(defn lookup
  "Geeft {:username .. :naam ..} voor een geldig token, anders nil.
  Ververs telkens laatst_gebruikt (bruikbaar voor verloop-beleid)."
  [ds token]
  (when (string? token)
    (when-let [row (first (jdbc/execute! ds ["SELECT username, naam FROM viewer_sessie
                                               WHERE token = ?" token]
                                          {:builder-fn rs/as-unqualified-maps}))]
      (jdbc/execute! ds ["UPDATE viewer_sessie SET laatst_gebruikt = ?
                           WHERE token = ?" (nu) token])
      row)))

(defn delete!
  "Verwijdert het token na uitloggen."
  [ds token]
  (jdbc/execute! ds ["DELETE FROM viewer_sessie WHERE token = ?" token]))
