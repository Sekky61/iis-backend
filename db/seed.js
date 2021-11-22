// DB seeding
// functions have format of seed_TABLENAME, take one parameter - object with values to be inserted

var appRoot = require('app-root-path');
const db = require(appRoot + '/postgres_util').get_db();
const bcrypt = require('bcrypt');



// trusts inputs
// generate hash and salt, store in db
exports.seed_user = async function (user_obj) {

    let password = user_obj.password;

    const saltRounds = 12;
    const hash = await bcrypt.hash(password, saltRounds)

    const q = `INSERT INTO uzivatel(id, Username, Heslo, Jmeno, Prijmeni, Email, Typ) VALUES($1, $2, $3, $4, $5, $6, $7) RETURNING *`;
    const values = [user_obj.id, user_obj.username, hash, user_obj.first_name, user_obj.last_name, user_obj.email, user_obj.account_type];

    return db.query(q, values).then((query_res) => { return query_res.rowCount; });
}

// trusts inputs
exports.seed_auction = async function (auction_obj) {

    const q = `INSERT INTO aukce(CisloAukce, Autor, Nazev, VyvolavaciCena, Cena, MinPrihoz, 
        IDobject, Pravidlo, Typ, MinPocetUcastniku, Stav, licitator, DelkaAukce, ZacatekAukce, KonecAukce) 
    VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15) RETURNING *`;
    const values = [
        auction_obj.cisloaukce,
        auction_obj.autor,
        auction_obj.nazev,
        auction_obj.vyvolavaci_cena,
        auction_obj.cena,
        auction_obj.min_prihoz,
        auction_obj.object,
        auction_obj.pravidlo,
        auction_obj.typ,
        (auction_obj.min_ucastniku == null) ? 1 : auction_obj.min_ucastniku,
        auction_obj.stav,
        auction_obj.licitator,
        auction_obj.delka_aukce,
        auction_obj.zacatek_aukce,
        auction_obj.konec_aukce
    ];

    return db.query(q, values).then((query_res) => { return query_res.rowCount; });
}

exports.seed_tag = async function (tag) {

    const q = `INSERT INTO tag(IDTag, nazev) VALUES($1, $2);`;
    const values = [tag.id, tag.name];

    return db.query(q, values).then((query_res) => { return query_res.rowCount; });
}

exports.seed_auction_tag = async function (row) {

    const q = `INSERT INTO aukce_tag(IDaukce, IDTag) VALUES($1, $2);`;
    const values = [row.auction_id, row.tag_id];

    return db.query(q, values).then((query_res) => { return query_res.rowCount; });
}

exports.seed_ucastnik = async function (ucastnik_obj) {

    const q = ` INSERT INTO ucastnik(IDUzivatele, IDaukce, Schvalen) VALUES($1, $2, $3)`;
    const values = [ucastnik_obj.user_id, ucastnik_obj.auction_id, ucastnik_obj.schvalen];

    return db.query(q, values).then((query_res) => { return query_res.rowCount == 1; });
}

exports.seed_objekt = async function (objekt) {

    const q = ` INSERT INTO objekt(IDobjektu, Adresa, Popis, foto_url) VALUES($1, $2, $3, $4)`;
    const values = [objekt.id_objektu, objekt.adresa, objekt.popis, objekt.foto_url];

    return db.query(q, values).then((query_res) => { return query_res.rowCount == 1; });
}

exports.seed_bid = async function (bid) {

    const q = `INSERT INTO prihoz(Ucastnik, IDaukce, Castka) VALUES($1, $2, $3);`;
    const values = [bid.ucastnik, bid.idaukce, bid.castka];

    return db.query(q, values).then((query_res) => { return query_res.rowCount; });
}
