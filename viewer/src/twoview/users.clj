(ns twoview.users
  "Gebruikers en tabelautorisaties, bewaard in een aparte SQLite
  database (configureerbaar via :users-database-url).

  Tabellen:
    viewer_gebruiker       (username, password, naam)
    viewer_gebruiker_tabel (username, tabel)   ; rij per toegestane tabel,
                                               ; of het wildcard \"alle\"
  Sessies staan hier NIET in: die worden in het geheugen bijgehouden
  (zie twoview.sessie)."
  (:require [next.jdbc :as jdbc]
            [next.jdbc.result-set :as rs]
            [clojure.string :as str]))

(defn init!
  "Maakt de gebruikerstabellen aan als ze nog niet bestaan."
  [ds]
  (jdbc/execute! ds ["CREATE TABLE IF NOT EXISTS viewer_gebruiker (
    username  TEXT PRIMARY KEY,
    password  TEXT NOT NULL,
    naam      TEXT)"])
  (jdbc/execute! ds ["CREATE TABLE IF NOT EXISTS viewer_gebruiker_tabel (
    username  TEXT NOT NULL,
    tabel     TEXT NOT NULL,
    PRIMARY KEY (username, tabel))"]))

(defn leeg? [ds]
  (zero? (:n (first (jdbc/execute! ds ["SELECT COUNT(*) AS n FROM viewer_gebruiker"]
                                   {:builder-fn rs/as-unqualified-maps})))))

(defn seed!
  "Vult de gebruikerstabellen vanuit de config, maar alleen als de
  database nog leeg is. Daarna beheer je gebruikers in de database."
  [ds initiele-gebruikers]
  (when (and (seq initiele-gebruikers) (leeg? ds))
    (doseq [[username {:keys [password naam tabellen]}] initiele-gebruikers]
      (jdbc/execute! ds ["INSERT INTO viewer_gebruiker (username, password, naam)
                           VALUES (?, ?, ?)" username password naam])
      (doseq [tabel (or tabellen ["alle"])]
        (jdbc/execute! ds ["INSERT INTO viewer_gebruiker_tabel (username, tabel)
                             VALUES (?, ?)" username tabel])))))

(defn check-login
  "Controleert gebruikersnaam/wachtwoord tegen de users-database.
  Geeft {:username .. :naam ..} terug bij succes, anders nil."
  [ds username password]
  (when (and (string? username) (string? password))
    (let [row (first (jdbc/execute! ds ["SELECT username, naam FROM viewer_gebruiker
                                          WHERE username = ? AND password = ?"
                                         username password]
                                    {:builder-fn rs/as-unqualified-maps}))]
      (when row (select-keys row [:username :naam])))))

(defn- geautoriseerde-tabellen
  "De set tabellen waar een gebruiker toegang toe heeft; het wildcard
  \"alle\" geldt als volledige toegang (geretourneerd als :alle)."
  [ds username]
  (let [tabellen (->> (jdbc/execute! ds ["SELECT tabel FROM viewer_gebruiker_tabel
                                           WHERE username = ?" username]
                                     {:builder-fn rs/as-unqualified-maps})
                      (map :tabel)
                      set)]
    (if (contains? tabellen "alle") :alle tabellen)))

(defn tabellen-voor
  "De tabellen die de gebruiker mag zien, geprojecteerd op de tabellen
  die daadwerkelijk in de gegevensdatabase bestaan."
  [ds gegevens-ds username]
  (let [autorisatie (geautoriseerde-tabellen ds username)
        bestaand    (twoview.db/list-tables gegevens-ds)]
    (if (= :alle autorisatie)
      bestaand
      (let [aut-set (set (map str/lower-case autorisatie))]
        (filter #(contains? aut-set (str/lower-case %)) bestaand)))))

(defn mag-tabel?
  "Of de gebruiker deze specifieke tabel mag bekijken."
  [ds username tabel]
  (let [autorisatie (geautoriseerde-tabellen ds username)]
    (or (= :alle autorisatie)
        (contains? (set (map str/lower-case autorisatie)) (str/lower-case tabel)))))
