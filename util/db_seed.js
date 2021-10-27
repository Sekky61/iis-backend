/**
 * SAMOSTATNĚ SPUSTITELNÝ SOUBOR
 * mock data gen
 */

// import config
require('dotenv').config();
const { port, pg_conn_string, session_secret } = require('../config');

// PostgreSQL client init
var postgres_util = require('../postgres_util');
postgres_util.connect_to_server();

const db_users = require('../db/users');
var fs = require('fs');

const users = JSON.parse(fs.readFileSync('util/users.json', 'utf8'));

main();

async function main() {
    try {
        for (let user_obj of users) {
            console.log(user_obj);
            try {
                await db_users.create_user(user_obj);
            } catch (e) {
                console.log(`DB error: ${e.message}`);
                return;
            }
        }
    } catch (e) {
        console.log(e);
    }

}