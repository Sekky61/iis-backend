var appRoot = require('app-root-path');
const db = require(appRoot + '/postgres_util').get_db();
const common = require(appRoot + '/common');

// trusts inputs
exports.create_auction = async function (auction_obj) {

    const q = `INSERT INTO aukce(Autor, Nazev, VyvolavaciCena, Cena, MinPrihoz, IDobject, Pravidlo, Typ, MinPocetUcastniku, Stav, licitator) 
    VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11);`;
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

    return db.query(q, values)
        .then((query_res) => { return query_res.rowCount == 1; })
        .catch((e) => { console.log(e); return false; });
}

exports.get_my_auctions = async function (uid) {

    const q = `SELECT CisloAukce, Cena, Nazev, Autor, IDobject, Pravidlo, Typ, ZacatekAukce, KonecAukce, MinPrihoz, MinPocetUcastniku, Licitator, 
    get_auction_status(CisloAukce) as stav
     FROM aukce WHERE aukce.Autor = $1;`;
    const values = [uid];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
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

    return db.query(q, values).then(
        (query_res) => { return query_res.rowCount == 1; },
        (e) => { console.log(e); return false }
    ); // todo more error handlers
}

// returns can_joins
// does not check if auction is in state where it is joinable - checks for user interests only
exports.can_join_user = async function (user_id, auction_id) {

    const q = `SELECT 1 WHERE NOT EXISTS (SELECT * FROM ucastnik WHERE IDUzivatele = $1 AND IDaukce = $2) 
        AND NOT EXISTS (SELECT * FROM aukce WHERE CisloAukce = $2 AND (Licitator = $1 OR Autor = $1))`;
    const values = [user_id, auction_id];

    return db.query(q, values).then(
        (query_res) => { return query_res.rowCount == 1; },
        (e) => { console.log(e); return false }
    );
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

// returns [success of prihoz, success of cena update]
// updates aukce row
exports.new_bid = async function (uid, auction_id, amount) {

    const q = `INSERT INTO prihoz(Ucastnik, IDaukce, Castka) VALUES($1, $2, $3);`;
    const values = [uid, auction_id, amount];

    const q2 = `UPDATE aukce SET Cena = $2 WHERE CisloAukce = $1`;
    const values2 = [auction_id, amount];

    return [
        db.query(q, values).then((query_res) => { return query_res.rowCount == 1; }),
        db.query(q2, values2).then((query_res) => { return query_res.rowCount == 1; })
    ];
}
