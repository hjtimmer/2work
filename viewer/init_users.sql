-- Voorbeeld-users-database voor de 2work viewer.
-- Aanmaken (SQLite CLI):
--   sqlite3 viewer_users.db < init_users.sql
--
-- Of gewoon de viewer starten: bij de eerste start worden deze
-- tabellen automatisch aangemaakt en gevuld vanuit
-- :initiele-gebruikers in config.edn. Daarna beheer je gebruikers
-- en autorisaties in deze database zelf.

CREATE TABLE IF NOT EXISTS viewer_gebruiker (
  username  TEXT PRIMARY KEY,
  password  TEXT NOT NULL,
  naam      TEXT
);

CREATE TABLE IF NOT EXISTS viewer_gebruiker_tabel (
  username  TEXT NOT NULL,
  tabel     TEXT NOT NULL,
  PRIMARY KEY (username, tabel)
);

-- Voorbeeldgebruikers (wachtwoorden in leesbare tekst; hash later)
INSERT OR IGNORE INTO viewer_gebruiker (username, password, naam) VALUES
  ('henk', 'henk123', 'Henk Timmermans'),
  ('gast', 'gast123', 'Gastgebruiker');

-- Autorisaties: een rij per toegestane tabel.
-- Wildcard 'alle' geeft toegang tot alle tabellen.
INSERT OR IGNORE INTO viewer_gebruiker_tabel (username, tabel) VALUES
  ('henk', 'alle'),                       -- henk mag alles
  ('gast', 'dossier'),                    -- gast alleen dossier
  ('gast', 'Document');                   -- ... en Document

-- Gebruiker toevoegen met beperkte toegang, bijvoorbeeld:
-- INSERT INTO viewer_gebruiker (username, password, naam)
--   VALUES ('collega', 'wachtwoord', 'Naam van collega');
-- INSERT INTO viewer_gebruiker_tabel (username, tabel)
--   VALUES ('collega', 'Relatie'), ('collega', 'dossier');
