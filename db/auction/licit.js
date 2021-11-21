var appRoot = require('app-root-path');
const db = require(appRoot + '/postgres_util').get_db();

// returns success
exports.join_auction_licit = async function (licit_id, auction_id) {

    const q = `UPDATE aukce SET Licitator = $1, Stav = 'schvalena' 
        WHERE CisloAukce = $2 AND Stav = 'neschvalena' AND Licitator IS NULL AND Autor != $1;`;
    const values = [licit_id, auction_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rowCount == 1; })
        .catch((e) => { console.log(e); return false; });
}

// returns success
exports.confirm_participant = async function (user_id, licit_id, auction_id) {

    const q = `UPDATE ucastnik SET schvalen = TRUE 
        WHERE IDUzivatele = $1 AND schvalen = FALSE AND IDaukce = $2 AND $3 = (SELECT Licitator FROM aukce WHERE CisloAukce = $2);`;
    const values = [user_id, auction_id, licit_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rowCount == 1; })
        .catch((e) => { console.log(e); return false; });
}

// returns success
exports.start_auction_licit = async function (licit_id, auction_id) { //todo minpocetucastniku nefunguje

    const q = `UPDATE aukce SET Stav = 'probihajici', ZacatekAukce = NOW(), KonecAukce = NOW() + DelkaAukce 
    WHERE CisloAukce = $1 AND Licitator = $2 AND Stav = 'schvalena' 
    AND MinPocetUcastniku >= (SELECT COUNT(*) FROM ucastnik WHERE IDaukce = $1 AND Schvalen = true);`;
    const values = [auction_id, licit_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rowCount == 1; })
        .catch((e) => { console.log(e); return false; });
}

// returns auctions array
// auctions where user_id is licitator
exports.list_auctions_licit = async function (user_id) {

    const q = `SELECT cisloaukce, Autor, Nazev, VyvolavaciCena, Cena, MinPrihoz, 
    IDobject, Pravidlo, Typ, MinPocetUcastniku, licitator, get_auction_status(CisloAukce) as stav, 
    delkaaukce, zacatekaukce, konecaukce, number_of_participants(CisloAukce) as PocetUcastniku
    FROM aukce 
    WHERE licitator = $1
    ORDER BY aukce.CisloAukce ASC;`;
    const values = [user_id];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}

// returns auctions array
// more detailed than public query
exports.list_auctions_full = async function (offset, number) {

    const q = `SELECT cisloaukce, Autor, Nazev, VyvolavaciCena, Cena, MinPrihoz, 
    IDobject, Pravidlo, Typ, MinPocetUcastniku, licitator, get_auction_status(CisloAukce) as stav, 
    delkaaukce, zacatekaukce, konecaukce
    FROM aukce 
    ORDER BY aukce.CisloAukce ASC 
    LIMIT $1 OFFSET $2`;
    const values = [number, offset];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}

// returns success
exports.list_all_unconfirmed_participants = async function (licit_id) {

    const q = `SELECT * FROM ucastnik, aukce
        WHERE ucastnik.IDaukce = aukce.cisloaukce AND aukce.licitator = $1 AND Schvalen = FALSE;`;
    const values = [licit_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows; })
        .catch((e) => { console.log(e); return []; });
}
