# 2work viewer

Read-only client-server viewer voor de 2work SQLite-database, volledig over **websockets**.

## Configuratie buiten de applicatie
De configuratie staat **niet in de jar/resources** maar in een los `config.edn` dat je naast de applicatie onderhoudt. De server zoekt in deze volgorde:
1. een pad als argument: `clj -M:run /etc/twoview/config.edn` (of `java -jar viewer.jar /etc/twoview/config.edn`)
2. `./config.edn` in de werkmap (typisch naast de jar)
3. (noodfallback, met waarschuwing in de log) `resources/config.edn` op het classpath

In de repo ligt een voorbeeld als [`viewer/config.edn`](config.edn): kopieer het naar de werkmap en pas de paden aan.

## Werking
- Alle datacommunicatie loopt via een websocket op `/ws` met JSON-berichten; de pagina is een dunne HTML/JS-client.
- **Geen cookies**. Na inloggen krijgt de client een token; de sessie staat **in het geheugen** van de server (hashmap). Elke sessie heeft een **expiratietijd die bij elke geslaagde database-actie wordt ververst** naar nu + `:sessie-max-seconden` (sliding expiration). Bij een server-herstart vervallen alle sessies.
- **Gebruikers en tabelautorisaties staan in een aparte SQLite-database** (`:users-database-url`):
  - `viewer_gebruiker (username, password, naam)`
  - `viewer_gebruiker_tabel (username, tabel)` — rij per toegestane tabel; wildcard `"alle"` geeft toegang tot alles.
  - Bij de eerste start wordt de database gevuld vanuit `:initiele-gebruikers` in de config (daarna beheer je gebruikers in de database zelf).
- De tabellenlijst per gebruiker is gefilterd op de autorisaties; tabel- en rij-acties worden per request gecontroleerd.
- Read-only: alleen SELECT-query's; identifiers worden gevalideerd tegen `sqlite_master`.

## Berichten
| Client stuurt | Server antwoordt |
|---|---|
| `{"action":"login","username":"..","password":".."}` | `{"type":"login-ok","token":"..","naam":".."}` of `login-fout` |
| `{"action":"tables","token":".."}` | `{"type":"tables","tables":[..]}` (alleen geautoriseerde tabellen) |
| `{"action":"table","token":"..","name":"..","page":1,"q":""}` | `{"type":"table",...}` |
| `{"action":"row","token":"..","name":"..","row-id":1}` | `{"type":"row","row":{..}}` |
| `{"action":"logout","token":".."}` | `{"type":"logout-ok"}` |

## Config (config.edn)
- `:database-url`: JDBC-URL naar de echte database.
- `:users-database-url`: SQLite-database met gebruikers en tabelautorisaties.
- `:sessie-max-seconden`: maximale sessieduur (seconden); ververst bij elke database-actie.
- `:certificaat`: username, password en alias, gereserveerd voor certificaat-/keystore-configuratie.
- `:initiele-gebruikers`: eenmalige seed voor de users-database.

## Draaien
```bash
cd viewer
cp config.edn ./   # staat al in de werkmap
clj -M:run                 # gebruikt ./config.edn
clj -M:run /etc/twoview/config.edn   # of expliciet pad
```
Server op `http://localhost:3000`, websocket op `ws://localhost:3000/ws`.

## Volgende stappen
- Wachtwoorden hashen (buddy-hashers) in `viewer_gebruiker`.
- Verlopen sessies periodiek opruimen (optioneel; verlopen tokens worden bij gebruik al verwijderd).
- FK-constraints uit `fk_constraints.sql` in de tabeldefinities opnemen.
