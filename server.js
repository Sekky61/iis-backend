require('dotenv').config();

// import config
const { port, pg_conn_string, session_secret } = require('./config');

main();

async function main() {

    // seed DB using ENV vars - Heroku does not let scripts access ENV vars
    console.log("ENV seed:");
    console.log(process.env.seed_db);
    if (process.env.seed_db) {
        const seed_function = require('./util/db_seed');
        await seed_function();
        console.log("Done. Continue with startup");
    } else {
        console.log("No seeding");
    }

    // inicializace frameworku Express
    // https://expressjs.com/en/api.html
    const express = require('express');
    const app = express();

    // json parser
    app.use(express.json());

    const session = require('express-session');
    const pgSession = require('connect-pg-simple')(session);

    // PostgreSQL client init
    var postgres_util = require('./postgres_util');
    postgres_util.connect_to_server();

    // Session columns
    let columnNames = {
        session_id: 'sid',
        session_data: 'sess',
        expire: 'expires_at'
    }

    const oneDay = 1000 * 60 * 60 * 24;

    let sess_obj = {
        store: new pgSession({
            pool: postgres_util.get_db(),   // Connection pool
            tableName: 'web_session',       // configurable
            conString: pg_conn_string,      // Alternate table name
            columns: columnNames
        }),
        secret: session_secret, // ENV var
        saveUninitialized: true,
        cookie: {
            maxAge: oneDay
        },
        resave: false
    };

    // secure cookies in production
    if (app.get('env') === 'production') {
        app.set('trust proxy', 1); // trust first proxy
        sess_obj.cookie.secure = true; // serve secure cookies
        sess_obj.cookie.sameSite = 'none';
    }

    app.use(session(sess_obj));

    // umožní dotazy přicházející od jinud
    // https://www.npmjs.com/package/cors
    const cors = require("cors")
    var corsOptions = {
        // domény, pro které jse cors povolen
        origin: ['http://localhost:3000', 'http://localhost:8080', 'https://xmajer21-iis.netlify.app', 'http://xmajer21-iis.netlify.app'],
        credentials: true,
        optionsSuccessStatus: 200 // some legacy browsers (IE11, various SmartTVs) choke on 204
    }
    app.use(cors(corsOptions));

    // mount api route
    let api_rt = require("./routes");
    const main = require('./util/db_seed');
    app.use("/api", api_rt);

    // serve photos
    app.use("/photos", express.static('photos'))

    app.get('/', (req, res) => {
        res.send("Backend IIS projektu aukce. Autoři: xmajer21, xpoucp01, xrezni28");
    });

    // start listening for connections
    app.listen(port, () => console.log('IIS backend listening on port ' + port));
}
