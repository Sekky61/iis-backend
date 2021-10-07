/**
 * Klient se jednou inicializuje pomocí connect_to_server
 * Každý modul si pak může vzít referenci na klienta přes get_db
 */

const { Pool } = require('pg');
const { pg_conn_string } = require('./config');

var _db;

module.exports = {

    connect_to_server: function () {
        _db = new Pool({
            connectionString: pg_conn_string,
            ssl: {
                rejectUnauthorized: false
            }
        });
    },

    get_db: function () {
        return _db;
    }
};