const db = require('../postgres_util').get_db();
const bcrypt = require('bcrypt');
const common = require('../common');

// trusts inputs
// generate hash and salt, store in db
exports.create_auction = async function (auction_obj) {

    const q = `INSERT INTO aukce(Autor, Nazev, VyvolavaciCena, MinPrihoz, IDobject, Pravidlo, Typ, MinPocetUcastniku, Stav) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING *`;
    const values = [
        auction_obj.autor,
        auction_obj.nazev,
        auction_obj.vyvolavaci_cena,
        auction_obj.min_prihoz,
        auction_obj.object,
        auction_obj.pravidlo,
        auction_obj.typ,
        auction_obj.min_ucastniku,
        auction_obj.stav
    ];

    return db.query(q, values);
}

exports.get_auctions = async function (offset, number) {

    const q = `SELECT * FROM aukce LIMIT $1 OFFSET $2`;
    const values = [number, offset];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}

exports.get_brief_auctions = async function (offset, number) {

    // todo join with object, here or in backend logic
    const q = `SELECT CisloAukce, Nazev, Autor, IDobject, Pravidlo, Typ, ZacatekAukce, KonecAukce  FROM aukce LIMIT $1 OFFSET $2`;
    const values = [number, offset];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}

exports.join_auction_licit = async function (licit_id, auction_id) {

    const q = `UPDATE aukce SET Licitator = $1, Stav = 'schvalena' WHERE CisloAukce = $2 AND Stav = 'neschvalena';`;
    const values = [licit_id, auction_id];

    return db.query(q, values).then((query_res) => { return query_res.rowCount; });
}

exports.join_auction_user = async function (user_id, auction_id) {

    const q = `INSERT INTO ucastnik(IDUzivatele, IDaukce) VALUES($1, $2);`; // schvalen defaults to false
    const values = [user_id, auction_id];

    try {
        return await db.query(q, values).then((query_res) => { return true; }); // todo check return true;
    } catch (e) {
        return false;
    }
}
