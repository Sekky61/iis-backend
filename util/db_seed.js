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
const tags = JSON.parse(fs.readFileSync('util/tags.json', 'utf8'));
const auction_tag = JSON.parse(fs.readFileSync('util/auction_tag.json', 'utf8'));

const tables = [
    { name: "users", data: users, inserter: db_users.create_user },
    { name: "auctions", data: auctions, inserter: db_auctions.create_auction },
    { name: "participants", data: participants, inserter: db_auctions.join_auction_user },
    { name: "tags", data: tags, inserter: db_auctions.new_tag },
    { name: "auction_tag", data: auction_tag, inserter: db_auctions.auction_add_tag }
];

async function main() {
    try {
        for (let table of tables) {

            for (let table_row of table.data) {
                let success = await table.inserter(table_row);
            }
            console.log(`✔ ${table.name}`);
        }
    } catch (e) {
        console.log(`✗`);
        console.log(e);
        return;
    }
}

main();