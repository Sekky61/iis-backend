var appRoot = require('app-root-path');
const db = require(appRoot + '/postgres_util').get_db();
const common = require(appRoot + '/common');

// trusts inputs
exports.create_auction = async function (auction_obj) {

    const q = `INSERT INTO aukce(Autor, Nazev, VyvolavaciCena, MinPrihoz, IDobject, Pravidlo, Typ, MinPocetUcastniku, Stav, licitator) 
    VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING *`;
    const values = [
        auction_obj.autor,
        auction_obj.nazev,
        auction_obj.vyvolavaci_cena,
        auction_obj.min_prihoz,
        auction_obj.object,
        auction_obj.pravidlo,
        auction_obj.typ,
        (auction_obj.min_ucastniku == null) ? 1 : auction_obj.min_ucastniku,
        auction_obj.stav,
        auction_obj.licitator,
    ];

    return db.query(q, values);
}

exports.join_auction_user = async function (row) { // row for easy insert script

    let { auction_id, user_id } = row;

    // ugh tohle byl boj
    const q = ` INSERT INTO ucastnik(IDUzivatele, IDaukce) 
        SELECT x::INT, y::INT FROM (VALUES($1, $2)) AS v (x, y)
        WHERE EXISTS (SELECT * FROM aukce WHERE CisloAukce = $3 AND Stav IN ('schvalena', 'probihajici'));`; // schvalen defaults to false
    const values = [user_id, auction_id, auction_id];

    try {
        return await db.query(q, values).then((query_res) => { return query_res.rowCount == 1; });
    } catch (e) {
        console.log(e);
        return false;
    }
}

exports.leave_auction_user = async function (user_id, auction_id) {

    const q = `DELETE FROM ucastnik WHERE IDaukce = $1 AND IDUzivatele = $2 RETURNING *;`; // schvalen defaults to false
    const values = [auction_id, user_id];

    try {
        return await db.query(q, values).then((query_res) => { return query_res.rowCount; }); // todo check return true;
    } catch (e) {
        console.log(e);
        return false;
    }
}

exports.get_participants = async function (auction_id) {

    const q = `SELECT uzivatel.iduzivatele, schvalen, username, jmeno, prijmeni, email FROM ucastnik, uzivatel WHERE ucastnik.IDaukce = $1 AND ucastnik.IDUzivatele = uzivatel.IDUzivatele;`;
    const values = [auction_id];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}

exports.get_auctions_user_participates = async function (uid) {

    const q = `SELECT idaukce, schvalen FROM ucastnik, uzivatel WHERE ucastnik.IDUzivatele = $1 AND ucastnik.IDUzivatele = uzivatel.IDUzivatele;`;
    const values = [uid];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}

exports.new_tag = async function (tag_name) {

    const q = `INSERT INTO tag(nazev) VALUES($1);`;;
    const values = [tag_name];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}

exports.auction_add_tag = async function (row) { // todo tag name

    const { tag_id, auction_id } = row;

    const q = `INSERT INTO aukce_tag(IDaukce, IDTag) VALUES($1, $2);`;;
    const values = [auction_id, tag_id];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}

exports.can_bid = async function (uid, auction_id) {

    const q = `SELECT EXISTS(select 1 from aukce WHERE CisloAukce = $2 AND Stav = 'probihajici')
    AND EXISTS(select 1 from ucastnik WHERE IDaukce = $2 AND IDUzivatele = $1 AND Schvalen);`
    const values = [uid, auction_id];

    return db.query(q, values).then((query_res) => { return query_res.rowCount; });
}

exports.new_bid = async function (uid, auction_id, amount) {

    const q = `INSERT INTO prihoz(Ucastnik, IDaukce, Castka) VALUES($1, $2, $3);`;
    const values = [uid, auction_id, amount];

    return db.query(q, values).then((query_res) => { return query_res.rowCount; });
}

exports.max_bid = async function (auction_id) {

    const q = `SELECT MAX(Castka) FROM prihoz WHERE IDaukce = $1`;
    const values = [auction_id];

    return db.query(q, values).then((query_res) => { return query_res.rows[0]; });
}

exports.get_bids = async function (auction_id) {

    const q = `SELECT Castka, Username FROM prihoz, uzivatel WHERE prihoz.Ucastnik = uzivatel.IDUzivatele AND IDaukce = $1`;
    const values = [auction_id];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}
