# 2work viewer

Read-only client-server viewer voor de 2work SQLite-database, volledig over **websockets**.

## Werking
- De pagina (`/`) is een dun HTML/JS-schil; álle datacommunicatie loopt via een websocket op `/ws` met JSON-berichten.
- **Geen cookies**: na inloggen (`action: "login"`) maakt de server een uniek token aan dat wordt bewaard in de **sessietabel** `viewer_sessie` in een aparte sessie-database (`:session-database-url`). De client stuurt dit token mee bij elke actie; de server controleert het telkens tegen de tabel.
- Tabel- en rijweergave, paginering (50 rijen) en zoeken in alle kolommen via `action: "table"`. Id-kolommen die voldoen aan de `<Tabel>id`-conventie (zie `fk_afgeleid.md`) zijn klikbare links.
- Read-only: alleen SELECT-query's; identifiers worden gevalideerd tegen `sqlite_master`.

## Berichten
| Client stuurt | Server antwoordt |
|---|---|
| `{"action":"login","username":"..","password":".."}` | `{"type":"login-ok","token":"..","naam":".."}` of `login-fout` |
| `{"action":"tables","token":".."}` | `{"type":"tables","tables":[..]}` |
| `{"action":"table","token":"..","name":"..","page":1,"q":""}` | `{"type":"table","columns":[..],"rows":[..],"page":..,"total":..}` |
| `{"action":"row","token":"..","name":"..","row-id":1}` | `{"type":"row","row":{..}}` |
| `{"action":"logout","token":".."}` | `{"type":"logout-ok"}` (token uit sessietabel verwijderd) |

## Configuratie (`resources/config.edn`)
- `:database-url`: JDBC-URL naar de echte database.
- `:session-database-url`: aparte SQLite-database met de sessietabel (zo blijft de gegevens-database read-only).
- `:certificaat`: username, password en alias, gereserveerd voor certificaat-/keystore-configuratie.
- `:users`: tijdelijke inloggegevens; vervang later door gehashte wachtwoorden of een gebruikerstabel.

## Draaien
```bash
clj -M:run
```
Server op `http://localhost:3000`, websocket op `ws://localhost:3000/ws`.

## Volgende stappen
- Tokenverloop opruimen (op basis van `laatst_gebruikt` in de sessietabel).
- Wachtwoorden hashen (buddy-hashers).
- FK-constraints uit `fk_constraints.sql` in de tabeldefinities opnemen.
