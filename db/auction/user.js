var appRoot = require('app-root-path');
const db = require(appRoot + '/postgres_util').get_db();
const common = require(appRoot + '/common');

// returns [success, auction_id] 
// trusts inputs => validate before
exports.create_auction = async function (auction_obj) {

    const q = `INSERT INTO aukce(Autor, Nazev, VyvolavaciCena, Cena, MinPrihoz, Pravidlo, Typ, MinPocetUcastniku, Stav, licitator, Adresa, Popis, foto_url) 
    VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13) RETURNING *;`;
    const values = [
        auction_obj.autor,
        auction_obj.nazev,
        auction_obj.vyvolavaci_cena,
        auction_obj.vyvolavaci_cena,
        auction_obj.min_prihoz,
        auction_obj.pravidlo,
        auction_obj.typ,
        (auction_obj.min_ucastniku == null) ? 1 : auction_obj.min_ucastniku,
        auction_obj.stav,
        auction_obj.licitator,
        auction_obj.adresa,
        auction_obj.popis,
        auction_obj.foto_url,
    ];

    return db.query(q, values)
        .then((query_res) => { return [query_res.rowCount == 1, query_res.rows[0]?.cisloaukce]; })
        .catch((e) => { console.log(e); return [false, undefined]; });
}

// returns array of my auctions
exports.get_my_auctions = async function (uid) { // todo order by ?

    const q = `SELECT CisloAukce, Cena, Nazev, Autor, get_username(Autor) as AutorUsername,
     Pravidlo, Typ, ZacatekAukce, KonecAukce, MinPrihoz, MinPocetUcastniku, Licitator, get_username(licitator) as LicitatorUsername, 
    get_auction_status(CisloAukce) as stav, Vitez, get_username(Vitez) as VitezUsername, number_of_checked_participants(CisloAukce) as pocetschvalenych
    FROM aukce
    WHERE aukce.Autor = $1;`;
    const values = [uid];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows; })
        .catch((e) => { console.log(e); return []; });
}

// returns success
exports.join_auction_user = async function (user_id, auction_id) {

    console.log(`user ${typeof user_id} ${user_id} auction ${typeof auction_id} ${auction_id}`)

    // ugh tohle byl boj
    // schvalen defaults to false
    const q = `INSERT INTO ucastnik(IDUzivatele, IDaukce) 
        SELECT x::INT, y::INT FROM (VALUES($1, $2)) AS v (x, y)
        WHERE EXISTS (SELECT * FROM aukce WHERE CisloAukce = $3 AND get_auction_status(CisloAukce) IN ('schvalena', 'probihajici'))
        AND NOT EXISTS (SELECT * FROM aukce WHERE CisloAukce = $4 AND (Licitator = $5 OR Autor = $6));`;
    const values = [user_id, auction_id, auction_id, auction_id, user_id, user_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rowCount == 1; })
        .catch((e) => { console.log(e); return false; });
}

// returns can_joins
// does not check if auction is in state where it is joinable - checks for user interests only
exports.can_join_user = async function (user_id, auction_id) {

    const q = `can_join($1, $2)`;
    const values = [user_id, auction_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rowCount == 1; })
        .catch((e) => { console.log(e); return false; });
}

// returns array of auctions
exports.user_can_join_auctions = async function (uid, auctions) {
    const q = `SELECT can_join($1, cisloaukce) as can_join,
     cisloaukce FROM aukce WHERE cisloaukce = ANY ($2::int[])`;
    const values = [uid, auctions];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows; })
        .catch((e) => { console.log(e); return undefined; });
}

// returns success
// can not leave after start
exports.leave_auction_user = async function (user_id, auction_id) {

    // schvalen defaults to false
    const q = `DELETE FROM ucastnik WHERE IDaukce = $1 AND IDUzivatele = $2
    AND 'schvalena' = (SELECT Stav from aukce WHERE CisloAukce = $1);`;
    const values = [auction_id, user_id];

    return await db.query(q, values)
        .then((query_res) => { return query_res.rowCount == 1; })
        .catch((e) => {
            console.log(e);
            return false;
        });
}

// returns auctions user participates in
exports.get_auctions_user_participates = async function (uid) { // todo join with aukce

    const q = `SELECT idaukce, schvalen FROM ucastnik, uzivatel
    WHERE ucastnik.IDUzivatele = $1 AND ucastnik.IDUzivatele = uzivatel.id ORDER BY ucastnik.idaukce ASC ;`;
    const values = [uid];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows; })
        .catch((e) => { console.log(e); return []; });
}

// returns participation data
exports.get_user_participation = async function (uid, auction_id) {

    const q = `SELECT * FROM ucastnik WHERE IDaukce = $1 AND IDUzivatele = $2;`;
    const values = [auction_id, uid];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows[0]; })
        .catch((e) => { console.log(e); return undefined; });
}

// returns true if user can place a bid
// checks amount as well
exports.can_bid = async function (uid, auction_id, amount) {

    const q = `SELECT EXISTS(
        SELECT 1 FROM aukce INNER JOIN ucastnik ON aukce.CisloAukce = ucastnik.IDaukce
        WHERE aukce.CisloAukce = $2 AND get_auction_status(aukce.CisloAukce) = 'probihajici'
        AND ucastnik.IDUzivatele = $1 AND ucastnik.Schvalen
        AND $3 - aukce.Cena >= aukce.MinPrihoz
    );`;
    const values = [uid, auction_id, amount];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows[0].exists; })
        .catch((e) => { console.log(e); return false; });
}

// returns [success of prihoz, success of cena update]
// updates aukce row
exports.new_bid = async function (uid, auction_id, amount) {

    const q = `INSERT INTO prihoz(Ucastnik, IDaukce, Castka) VALUES($1, $2, $3);`;
    const values = [uid, auction_id, amount];

    const q2 = `UPDATE aukce SET Cena = $2 WHERE CisloAukce = $1`;
    const values2 = [auction_id, amount];

    return [
        db.query(q, values)
            .then((query_res) => { return query_res.rowCount == 1; })
            .catch((e) => { console.log(e); return false; }),
        db.query(q2, values2)
            .then((query_res) => { return query_res.rowCount == 1; })
            .catch((e) => { console.log(e); return false; })
    ];
}

// returns true if user can place a bid
// checks amount as well
exports.save_picture_link = async function (auction_id, picture_link) {

    const q = `UPDATE aukce SET foto_url = $2 WHERE cisloaukce = $1`;
    const values = [auction_id, picture_link];

    return db.query(q, values)
        .then((query_res) => { return query_res.rowCount == 1; })
        .catch((e) => { console.log(e); return false; });
}

exports.add_tags = async function (auction_id, tags) {

    const q = `INSERT INTO aukce_tag(IDaukce, IDTag) VALUES($1, tag_name_get_id($2));`;

    let promises = [];
    for (let tag of tags) {
        const values = [auction_id, tag];
        promises.push(
            db.query(q, values).then((query_res) => { return query_res.rowCount == 1; })
        )
    }

    return promises;
}
