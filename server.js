require('dotenv').config();

// import config
const { port, pg_conn_string } = require('./config');

// inicializace frameworku Express
// https://expressjs.com/en/api.html
const express = require('express');
const app = express();

// umožní dotazy přicházející od jinud
// https://www.npmjs.com/package/cors
const cors = require("cors")
app.use(cors());

// json parser
app.use(express.json());

// PostgreSQL client init
var postgres_util = require('./postgres_util');
postgres_util.connect_to_server();

// session
// const cookieParser = require("cookie-parser");
// app.use(cookieParser());

const session = require('express-session');

const pg = require('pg');

const pgSession = require('connect-pg-simple')(session);

const oneDay = 1000 * 60 * 60 * 24;
app.use(session({
    store: new pgSession({
        pool: postgres_util.get_db(),                // Connection pool
        tableName: 'session',   // Use another table-name than the default "session" one
        conString: pg_conn_string
    }),
    secret: "thisismysecrctekeyfhrgfgrfrty84fwir767",
    saveUninitialized: true,
    cookie: { maxAge: oneDay },
    resave: false
}));

if (app.get('env') === 'production') {
    app.set('trust proxy', 1) // trust first proxy
    sess.cookie.secure = true // serve secure cookies
}

// mount api route
let api_rt = require("./api_routes");
app.use("/api", api_rt);

// start listening for connections
app.listen(port, () => console.log('xPress listening on port ' + port));
