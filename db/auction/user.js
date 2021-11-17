var appRoot = require('app-root-path');
const db = require(appRoot + '/postgres_util').get_db();
const common = require(appRoot + '/common');

// trusts inputs
exports.create_auction = async function (auction_obj) {

    const q = `INSERT INTO aukce(Autor, Nazev, VyvolavaciCena, Cena, MinPrihoz, IDobject, Pravidlo, Typ, MinPocetUcastniku, Stav, licitator) 
    VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING *`;
    const values = [
        auction_obj.autor,
        auction_obj.nazev,
        auction_obj.vyvolavaci_cena,
        auction_obj.vyvolavaci_cena,
        auction_obj.min_prihoz,
        auction_obj.object,
        auction_obj.pravidlo,
        auction_obj.typ,
        (auction_obj.min_ucastniku == null) ? 1 : auction_obj.min_ucastniku,
        auction_obj.stav,
        auction_obj.licitator,
    ];

    return db.query(q, values).then((query_res) => { return query_res.rowCount; });
}

exports.join_auction_user = async function (user_id, auction_id) { // row for easy insert script

    // ugh tohle byl boj
    const q = ` INSERT INTO ucastnik(IDUzivatele, IDaukce) 
        SELECT x::INT, y::INT FROM (VALUES($1, $2)) AS v (x, y)
        WHERE EXISTS (SELECT * FROM aukce WHERE CisloAukce = $3 AND get_auction_status(CisloAukce) IN ('schvalena', 'probihajici'));`; // schvalen defaults to false
    const values = [user_id, auction_id, auction_id];

    return db.query(q, values).then(
        (query_res) => { return query_res.rowCount == 1; },
        (e) => { console.log(e); return false }
    ); // todo more error handlers
}

// can not leave after start
exports.leave_auction_user = async function (user_id, auction_id) {

    const q = `DELETE FROM ucastnik WHERE IDaukce = $1 AND IDUzivatele = $2
    AND 'schvalena' = (SELECT Stav from aukce WHERE CisloAukce = $1) RETURNING *;`; // schvalen defaults to false
    const values = [auction_id, user_id];

    try {
        return await db.query(q, values).then((query_res) => { return query_res.rowCount; }); // todo check return true;
    } catch (e) {
        console.log(e);
        return false;
    }
}

exports.get_participants = async function (auction_id) {

    const q = `SELECT uzivatel.id, schvalen, username, jmeno, prijmeni, email 
    FROM ucastnik, uzivatel WHERE ucastnik.IDaukce = $1 AND ucastnik.IDUzivatele = uzivatel.id;`;
    const values = [auction_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows; }
        );
}

exports.get_auctions_user_participates = async function (uid) {

    const q = `SELECT idaukce, schvalen FROM ucastnik, uzivatel WHERE ucastnik.IDUzivatele = $1 AND ucastnik.IDUzivatele = uzivatel.id;`;
    const values = [uid];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}

exports.auction_add_tag = async function (row) { // todo tag name

    const { tag_id, auction_id } = row;

    const q = `INSERT INTO aukce_tag(IDaukce, IDTag) VALUES($1, $2);`;
    const values = [auction_id, tag_id];

    return db.query(q, values).then((query_res) => { return query_res.rowCount; });
}

exports.can_bid = async function (uid, auction_id, amount) {

    const q = `SELECT EXISTS(
        SELECT 1 FROM aukce INNER JOIN ucastnik ON aukce.CisloAukce = ucastnik.IDaukce
        WHERE aukce.CisloAukce = $2 AND get_auction_status(aukce.CisloAukce) = 'probihajici'
        AND ucastnik.IDUzivatele = $1 AND ucastnik.Schvalen
        AND $3 - aukce.Cena >= aukce.MinPrihoz
    );`;
    const values = [uid, auction_id, amount];

    return db.query(q, values).then((query_res) => { return query_res.rows[0].exists; });
}

// updates aukce row
exports.new_bid = async function (uid, auction_id, amount) {

    const q = `INSERT INTO prihoz(Ucastnik, IDaukce, Castka) VALUES($1, $2, $3);`;
    const values = [uid, auction_id, amount];

    const q2 = `UPDATE aukce SET Cena = $2 WHERE CisloAukce = $1`;
    const values2 = [auction_id, amount];

    return [
        db.query(q, values).then((query_res) => { return query_res.rowCount; }),
        db.query(q2, values2).then((query_res) => { return query_res.rowCount; })
    ];
}

exports.max_bid = async function (auction_id) {

    const q = `SELECT MAX(Castka) FROM prihoz WHERE IDaukce = $1`;
    const values = [auction_id];

    return db.query(q, values).then((query_res) => { return query_res.rows[0]; });
}

exports.get_bids = async function (auction_id) {

    const q = `SELECT Castka, Username FROM prihoz, uzivatel WHERE prihoz.Ucastnik = uzivatel.id AND IDaukce = $1`;
    const values = [auction_id];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}
