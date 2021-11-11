var appRoot = require('app-root-path');
const db = require(appRoot + '/postgres_util').get_db();
const common = require(appRoot + '/common');

exports.join_auction_licit = async function (licit_id, auction_id) {

    const q = `UPDATE aukce SET Licitator = $1, Stav = 'schvalena' WHERE CisloAukce = $2 AND Stav = 'neschvalena';`; // todo and licit != null
    const values = [licit_id, auction_id];

    return db.query(q, values).then((query_res) => { return query_res.rowCount; });
}

exports.start_auction_licit = async function (licit_id, auction_id, participants) {

    const q = `UPDATE aukce SET Stav = 'probihajici' WHERE CisloAukce = $1 AND Licitator = $2 AND Stav = 'schvalena' AND MinPocetUcastniku >= $3;`; // todo and licit != null
    const values = [auction_id, licit_id, participants];

    return db.query(q, values).then((query_res) => { return query_res.rowCount; });
}

exports.confirm_participant = async function (user_id, auction_id) {

    const q = `UPDATE ucastnik SET schvalen = TRUE WHERE IDUzivatele = $1 AND IDaukce = $2;`;
    const values = [user_id, auction_id];

    return db.query(q, values).then((query_res) => { return query_res.rowCount; });
}
