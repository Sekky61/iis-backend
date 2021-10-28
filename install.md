# instalace

Pro instalaci node.js doporučuju 
[nvm](https://github.com/nvm-sh/nvm/blob/master/README.md#installing-and-updating) (Node Version Manager). Node mám `v16.6.1` a jsem bez problémů.

Dále vyžaduje `npm`


```
git clone https://github.com/Sekky61/iis-backend.git
cd iis-backend
npm i
```

# Development
`npm run dev` spusti server, nejspíš na localhost:3000

I dev mode vyžaduje připojení na postgresql, můsíte proto

1. nainstalovat postgres
2. založit databázi a inicializovat
3. nastavit secrets

## Secrets

**! `.env` a další secrets se necommitují !**

Backend používá `dotenv`, nemusí se tedy nastavovat proměnné v prostředí. 
Stačí mít v kořeni projektu soubor `.env` a v něm záznamy typu

```
PG_CONN_STRING=postgresql://jmeno:heslo@localhost:5432/nazev-db
SESSION_SECRET=nejakyNahodnyTajnyString
```

## DB

CLI `psql`

Grafické rozhraní [pgAdmin](https://www.pgadmin.org/download/pgadmin-4-apt/)

Inicializace DB: `psql -U [username] -d [db-name] -a -f util/schema.sql`

Naplnění DB: `node util/db_seed.js`

# Deployment

backend hostován na https://xmajer21-iis.herokuapp.com/
včetně postgresu - free verze má omezení, ale na demo by měla stačit

deployment je automatický na hlavní branchi

## Seedování databáze

Zatím ručně přes Heroku ssh, todo script
`cat schema.sql  | heroku pg:psql --app xmajer21-iis`
