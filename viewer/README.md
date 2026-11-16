# 2work viewer

Read-only client-server viewer voor de 2work SQLite-database, volledig over **websockets**, frontend in **Reagent + Material UI**.

## Frontend bouwen (eenmalig, daarna bij elke code-wijziging)
De interface is een ClojureScript SPA met Material UI-componenten, gebouwd met shadow-cljs:
```bash
cd viewer/frontend
npm install
npx shadow-cljs watch app     # ontwikkel, met hot reload op :8020
# of voor productie:
npx shadow-cljs release app
```
De gebouwde JS belandt automatisch in `viewer/resources/public/js`, zodat de Clojure-server (poort 3000) hem serveert op `/js/main.js`. Voor development kun je ook `http://localhost:8020` gebruiken (shadow-cljs dev-server op dezelfde resources).

Het inlogscherm heeft een oog-knop om het wachtwoord zichtbaar te maken.

## Configuratie buiten de applicatie
De configuratie staat in een los `config.edn` dat je naast de applicatie onderhoudt. De server zoekt in deze volgorde:
1. een pad als argument: `clj -M:run /etc/twoview/config.edn`
2. `./config.edn` in de werkmap
3. (noodfallback, met waarschuwing in de log) `resources/config.edn` op het classpath

Voorbeeld: [`viewer/config.edn`](config.edn).

## Users-database (gebruikers + autorisaties)
Zie [`init_users.sql`](init_users.sql); of start de viewer één keer, dan worden de tabellen automatisch aangemaakt en éénmalig gevuld vanuit `:initiele-gebruikers`. Tabellen:
- `viewer_gebruiker (username, password, naam)`
- `viewer_gebruiker_tabel (username, tabel)` — wildcard `"alle"` geeft toegang tot alles.

## Testdatabase
```bash
sqlite3 2work_test.db < init_testdata.sql
```
En in `config.edn`: `:database-url "jdbc:sqlite:2work_test.db"`.

## Werking
- Alle datacommunicatie via websocket `/ws` met JSON-berichten; sessies: in-memory token, expiratie ververst bij elke database-actie (`:sessie-max-seconden`).
- Geen cookies. Tabellenlijst en -acties zijn gefilterd op de autorisaties van de gebruiker.
- Read-only: alleen SELECT-query's; identifiers gevalideerd tegen `sqlite_master`.

## Berichten
| Client stuurt | Server antwoordt |
|---|---|
| `{"action":"login","username":"..","password":".."}` | `{"type":"login-ok","token":"..","naam":".."}` |
| `{"action":"tables","token":".."}` | `{"type":"tables","tables":[..]}` |
| `{"action":"table","token":"..","name":"..","page":1,"q":""}` | `{"type":"table",...}` |
| `{"action":"row","token":"..","name":"..","row-id":1}` | `{"type":"row","row":{..}}` |
| `{"action":"logout","token":".."}` | `{"type":"logout-ok"}` |

## Draaien
```bash
cd viewer/frontend && npm install && npx shadow-cljs release app   # frontend
cd viewer && clj -M:run                                            # server
```
Open `http://localhost:3000`.

## Volgende stappen
- Wachtwoorden hashen (buddy-hashers) in `viewer_gebruiker`.
- Uitloggen-knop in de UI koppelen aan `action: "logout"`.
- FK-constraints uit `fk_constraints.sql` in de tabeldefinities opnemen.
