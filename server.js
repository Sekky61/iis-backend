require('dotenv').config();

// import config
const { port, pg_conn_string, session_secret } = require('./config');

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

// do budoucna, cookies
// const cookieParser = require("cookie-parser");
// app.use(cookieParser());

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
    cookie: { maxAge: oneDay },
    resave: false
};

// secure cookies in production
if (app.get('env') === 'production') {
    app.set('trust proxy', 1) // trust first proxy
    sess_obj.cookie.secure = true // serve secure cookies
}

app.use(session(sess_obj));

// umožní dotazy přicházející od jinud
// https://www.npmjs.com/package/cors
const cors = require("cors")
var corsOptions = {
    origin: ['http://localhost:3000', 'http://localhost:8080', 'https://angry-curran-002b54.netlify.app'],
    credentials: true,
    optionsSuccessStatus: 200 // some legacy browsers (IE11, various SmartTVs) choke on 204
}
app.use(cors(corsOptions));

// mount api route
let api_rt = require("./routes");
app.use("/api", api_rt);

// start listening for connections
app.listen(port, () => console.log('IIS backend listening on port ' + port));
