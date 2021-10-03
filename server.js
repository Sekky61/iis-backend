require('dotenv').config();

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

// import config
const { port } = require('./config');

// PostgreSQL client init
var postgres_util = require('./postgres_util');
postgres_util.connect_to_server();

// mount api route
let api_rt = require("./api_routes");
app.use("/api", api_rt);

// start listening for connections
app.listen(port, () => console.log('xPress listening on port ' + port));
