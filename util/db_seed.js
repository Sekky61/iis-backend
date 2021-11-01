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
const db_auctions = require('../db/auction');

var fs = require('fs');
const { exit } = require('process');

const users = JSON.parse(fs.readFileSync('util/users.json', 'utf8'));
const auctions = JSON.parse(fs.readFileSync('util/auctions.json', 'utf8'));
const participants = JSON.parse(fs.readFileSync('util/participants.json', 'utf8'));

const tables = [
    { name: "users", data: users, inserter: db_users.create_user },
    { name: "auctions", data: auctions, inserter: db_auctions.create_auction },
    { name: "participants", data: participants, inserter: db_auctions.join_auction_user }
];

async function main() {
    try {
        for (let table of tables) {

            let promises = [];

            for (let table_row of table.data) {
                promises.push(table.inserter(table_row));
            }

            await Promise.all(promises).then((values) => {
                console.log(`✔ ${table.name}`);
            });
        }
    } catch (e) {
        console.log(e);
        exit(1);
    }
}

main();