/**
 * SAMOSTATNĚ SPUSTITELNÝ SOUBOR
 * mock data gen
 */

// import config
require('dotenv').config();

async function main() {

    const { port, pg_conn_string, session_secret } = require('../config');

    const db_seed = require('../db/seed');

    var fs = require('fs');
    const { Console } = require('console');

    const users = JSON.parse(fs.readFileSync('util/users.json', 'utf8'));
    const auctions = JSON.parse(fs.readFileSync('util/auctions.json', 'utf8'));
    const participants = JSON.parse(fs.readFileSync('util/participants.json', 'utf8'));
    const tags = JSON.parse(fs.readFileSync('util/tags.json', 'utf8'));
    const auction_tag = JSON.parse(fs.readFileSync('util/auction_tag.json', 'utf8'));
    const bids = JSON.parse(fs.readFileSync('util/bid.json', 'utf8'));
    const objects = JSON.parse(fs.readFileSync('util/objects.json', 'utf8'));

    const tables = [
        { name: "users", data: users, inserter: db_seed.seed_user },
        { name: "objects", data: objects, inserter: db_seed.seed_object },
        { name: "auctions", data: auctions, inserter: db_seed.seed_auction },
        { name: "participants", data: participants, inserter: db_seed.seed_ucastnik },
        { name: "tags", data: tags, inserter: db_seed.seed_tag },
        { name: "auction_tag", data: auction_tag, inserter: db_seed.seed_auction_tag },
        { name: "bids", data: bids, inserter: db_seed.seed_bid }
    ];

    // PostgreSQL client init
    var postgres_util = require('../postgres_util');
    postgres_util.connect_to_server();

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

if (require.main === module) {
    // called from cli
    main();
} else {
    // called as module
}

module.exports = main;