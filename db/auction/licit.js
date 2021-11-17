var appRoot = require('app-root-path');
const db = require(appRoot + '/postgres_util').get_db();

// return success
exports.join_auction_licit = async function (licit_id, auction_id) {

    const q = `UPDATE aukce SET Licitator = $1, Stav = 'schvalena' 
        WHERE CisloAukce = $2 AND Stav = 'neschvalena' AND Licitator IS NULL;`;
    const values = [licit_id, auction_id];

    return db.query(q, values).then((query_res) => { return query_res.rowCount == 1; });
}

// return success
exports.confirm_participant = async function (user_id, licit_id, auction_id) {

    const q = `UPDATE ucastnik SET schvalen = TRUE 
        WHERE IDUzivatele = $1 AND IDaukce = $2 AND $3 = (SELECT Licitator FROM aukce WHERE CisloAukce = $2);`;
    const values = [user_id, auction_id, licit_id];

    return db.query(q, values).then((query_res) => { return query_res.rowCount == 1; });
}

exports.start_auction_licit = async function (licit_id, auction_id) {

    const q = `UPDATE aukce SET Stav = 'probihajici', ZacatekAukce = NOW(), KonecAukce = NOW() + DelkaAukce 
    WHERE CisloAukce = $1 AND Licitator = $2 AND Stav = 'schvalena' 
    AND MinPocetUcastniku >= (SELECT COUNT(*) FROM ucastnik WHERE IDaukce = $1 AND Schvalen = true);`;
    const values = [auction_id, licit_id];

    return db.query(q, values).then((query_res) => { return query_res.rowCount == 1; });
}

exports.list_auctions_full = async function (offset, number) {

    const q = `SELECT cisloaukce, Autor, Nazev, VyvolavaciCena, Cena, MinPrihoz, 
    IDobject, Pravidlo, Typ, MinPocetUcastniku, licitator, get_auction_status(CisloAukce) as stav, 
    delkaaukce, zacatekaukce, konecaukce, prodejnicena
    FROM aukce LIMIT $1 OFFSET $2`;
    const values = [number, offset];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}
