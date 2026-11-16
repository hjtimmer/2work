# 2work viewer

Read-only client-server viewer voor de 2work SQLite-database.

## Features
- Inlogscherm; gebruikers staan voorlopig in `config.edn` (zie `resources/config.edn`).
- Overzicht van alle tabellen in de database.
- Tabelweergave met paginering (50 rijen) en zoeken in alle kolommen.
- Kolommen die eindigen op `id` worden als verwijzing getoond (link naar de rij in de doeltabel), volgens dezelfde conventie als in `fk_afgeleid.md`.
- Read-only: de applicatie voert uitsluitend SELECT-query's uit; tabel- en kolomnamen worden gevalideerd tegen de database.

## Configuratie (`resources/config.edn`)
- `:database-url`: JDBC-URL naar de echte database, bijv. `"jdbc:sqlite:/pad/naar/2work.db"`.
- `:certificaat`: username, password en alias, gereserveerd voor certificaat-/keystore-configuratie.
- `:users`: gebruikers die mogen inloggen (naam, wachtwoord, weergavenaam). Zet later gehashte wachtwoorden neer of gebruik een gebruikerstabel.

## Draaien
```bash
clj -M:run
```
of gebouwd: `clj -M -m twoview.core`. De server start op `http://localhost:3000`.

## Structuur
- `src/twoview/core.clj`: startpunt, leest config, start Jetty.
- `src/twoview/handler.clj`: routes, sessies, login.
- `src/twoview/db.clj`: read-only SQL-toegang met validatie.
- `src/twoview/views.clj`: Hiccup-HTML (inlogscherm, tabellen, rijen).

## Volgende stappen
- Wachtwoorden hashen (buddy-hashers) of inloggegevens uit de database halen.
- Kolomnamen uit `ApplicatieTabelKolom` gebruiken als leesbare opschriften.
- De afgeleide relaties uit `fk_constraints.sql` in de tabellen opnemen als echte FOREIGN KEY-clausules.
