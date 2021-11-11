var appRoot = require('app-root-path');
const db = require(appRoot + '/postgres_util').get_db();
const common = require(appRoot + '/common');

// trusts inputs
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

exports.list_auctions = async function (offset, number) {

    const q = `SELECT CisloAukce, Nazev, Autor, IDobject, Pravidlo, Typ, ZacatekAukce, KonecAukce FROM aukce LIMIT $1 OFFSET $2`;
    const values = [number, offset];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}

exports.get_brief_auctions = async function (offset, number) {

    // todo join with object, here or in backend logic
    const q = `SELECT CisloAukce, 1 AS cena, Nazev, Autor, IDobject, Pravidlo, Typ, ZacatekAukce, KonecAukce,
    ARRAY(SELECT tag.nazev FROM aukce_tag, tag WHERE aukce_tag.IDaukce = CisloAukce AND aukce_tag.idtag = tag.idtag) as tagy
    FROM aukce LIMIT $1 OFFSET $2`;
    const values = [number, offset];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}

exports.join_auction_user = async function (row) {

    let { auction_id, user_id } = row;

    const q = `INSERT INTO ucastnik(IDUzivatele, IDaukce) VALUES($1, $2);`; // schvalen defaults to false
    const values = [user_id, auction_id];

    try {
        return await db.query(q, values).then((query_res) => { return true; }); // todo check return true;
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

exports.get_auctions = async function (uid) {

    const q = `SELECT idaukce, schvalen FROM ucastnik, uzivatel WHERE ucastnik.IDUzivatele = $1 AND ucastnik.IDUzivatele = uzivatel.IDUzivatele;`;
    const values = [uid];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}

exports.get_auction = async function (auction_id) {
    // todo nahradit *
    const q = `
        SELECT CisloAukce, Nazev, Autor, IDobject, Pravidlo, Typ, ZacatekAukce, KonecAukce, 
        ARRAY(SELECT tag.nazev FROM aukce_tag, tag WHERE aukce_tag.IDaukce = $1 AND aukce_tag.idtag = tag.idtag) as tagy
        FROM aukce WHERE CisloAukce = $2;`;
    const values = [auction_id, auction_id];

    return db.query(q, values).then((query_res) => { return query_res.rows[0]; });
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
