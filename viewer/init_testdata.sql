-- Kleine testversie van de 2work gegevensdatabase.
-- Aanmaken (SQLite CLI):
--   sqlite3 2work_test.db < init_testdata.sql
-- En in config.edn:  :database-url "jdbc:sqlite:2work_test.db"
--
-- Bevat een handjevol tabellen uit het echte schema, met dezelfde
-- naamconventies (kolommen eindigend op "id" verwijzen naar de tabel
-- met die naam minus "id"). De foreign keys zijn hier, als
-- demonstratie, wel als constraints opgenomen (SQLite ondersteunt
-- die alleen in CREATE TABLE, niet via ALTER TABLE; zie
-- fk_constraints.sql).

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS Gebruiker (
  gebruikerid  INTEGER PRIMARY KEY,
  naam         TEXT NOT NULL,
  email        TEXT
);

CREATE TABLE IF NOT EXISTS Relatie (
  relatieid    INTEGER PRIMARY KEY,
  naam         TEXT NOT NULL,
  debiteurnummer TEXT
);

CREATE TABLE IF NOT EXISTS Status (
  statusid     INTEGER PRIMARY KEY,
  code         TEXT NOT NULL,
  naam         TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Rekening (
  rekeningid   INTEGER PRIMARY KEY,
  omschrijving TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS dossier (
  dossierid    INTEGER PRIMARY KEY,
  relatieid    INTEGER NOT NULL REFERENCES Relatie(relatieid),
  statusid     INTEGER REFERENCES Status(statusid),
  kenmerk      TEXT,
  aanmaakdatum TEXT
);

CREATE TABLE IF NOT EXISTS Document (
  documentid   INTEGER PRIMARY KEY,
  dossierid    INTEGER NOT NULL REFERENCES dossier(dossierid),
  relatieid    INTEGER REFERENCES Relatie(relatieid),
  statusid     INTEGER REFERENCES Status(statusid),
  bestandnaam  TEXT,
  aanmaakdatum TEXT
);

-- Testdata -------------------------------------------------------------

INSERT OR IGNORE INTO Gebruiker (gebruikerid, naam, email) VALUES
  (1, 'Henk Timmermans', 'henk@example.nl'),
  (2, 'Collega de Vries', 'collega@example.nl');

INSERT OR IGNORE INTO Relatie (relatieid, naam, debiteurnummer) VALUES
  (1, 'Familie Jansen', 'DEB001'),
  (2, 'Familie Bakker', 'DEB002'),
  (3, 'Stichting Woonzorg', 'DEB003');

INSERT OR IGNORE INTO Status (statusid, code, naam) VALUES
  (1, 'OPEN', 'Open'),
  (2, 'INBEH', 'In behandeling'),
  (3, 'AFG', 'Afgerond');

INSERT OR IGNORE INTO Rekening (rekeningid, omschrijving) VALUES
  (1, 'Beheerrekening'),
  (2, 'Spaarrekening');

INSERT OR IGNORE INTO dossier (dossierid, relatieid, statusid, kenmerk, aanmaakdatum) VALUES
  (1, 1, 1, 'DOS-2026-001', '2026-01-12'),
  (2, 1, 2, 'DOS-2026-002', '2026-02-03'),
  (3, 2, 3, 'DOS-2026-003', '2026-03-21'),
  (4, 3, 2, 'DOS-2026-004', '2026-04-05');

INSERT OR IGNORE INTO Document (documentid, dossierid, relatieid, statusid, bestandnaam, aanmaakdatum) VALUES
  (1, 1, 1, 1, 'intake_jansen.pdf',    '2026-01-15'),
  (2, 1, 1, 2, 'mutatieformulier.pdf', '2026-01-20'),
  (3, 2, 1, 2, 'bankafschrift.pdf',    '2026-02-10'),
  (4, 3, 2, 3, 'eindrapport.pdf',      '2026-03-30'),
  (5, 4, 3, 2, 'overeenkomst.docx',    '2026-04-08'),
  (6, 4, 3, 1, 'identiteit.pdf',       '2026-04-09');
