var appRoot = require('app-root-path');
const db = require(appRoot + '/postgres_util').get_db();

// returns [success, auction_id] 
// trusts inputs => validate before
exports.create_auction = async function (auction_obj) {

    const q = `
    INSERT INTO aukce(Autor, Nazev, VyvolavaciCena, Cena, MinPrihoz, Pravidlo, Typ, MinPocetUcastniku, Stav, licitator, objekt) 
    VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) 
    RETURNING *;`;
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
        auction_obj.objekt
    ];

    return db.query(q, values)
        .then((query_res) => { return [query_res.rowCount == 1, query_res.rows[0]?.cisloaukce]; })
        .catch((e) => { console.log(e); return [false, undefined]; });
}

// returns [success, object_id] 
// trusts inputs => validate before
exports.create_object = async function (objekt) {

    const q = `
    INSERT INTO objekt(Nazev, majitel, Adresa, Popis, foto_url) 
    VALUES($1, $2, $3, $4, $5)
    RETURNING *`;
    const values = [objekt.nazev, objekt.majitel, objekt.adresa, objekt.popis, objekt.foto_url];

    return db.query(q, values)
        .then((query_res) => { return [query_res.rowCount == 1, query_res.rows[0].idobjektu]; })
        .catch((e) => { console.log(e); return [false, undefined]; });
}

// returns array of my auctions
exports.get_my_auctions = async function (uid) {

    const q = `
    SELECT CisloAukce, Cena, aukce.Nazev, Autor, get_username(Autor) as AutorUsername,
        Pravidlo, Typ, ZacatekAukce, KonecAukce, MinPrihoz, MinPocetUcastniku, Licitator, 
        get_username(licitator) as LicitatorUsername, get_auction_status(CisloAukce) as stav, 
        Vitez, get_username(Vitez) as VitezUsername, number_of_checked_participants(CisloAukce) as pocetschvalenych,
        aukce.objekt,
        objekt.nazev  as objekt_nazev, objekt.Adresa, objekt.Popis, objekt.foto_url
    FROM aukce
    LEFT JOIN objekt 
        ON aukce.objekt = objekt.idobjektu
    WHERE aukce.Autor = $1
    ORDER BY aukce.CisloAukce ASC;`;
    const values = [uid];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows; })
        .catch((e) => { console.log(e); return []; });
}

// returns array of my auctions
exports.get_my_objects = async function (uid) {

    const q = `
    SELECT IDobjektu, Nazev, Adresa, Popis, foto_url
    FROM objekt
    WHERE majitel = $1
    ORDER BY IDobjektu ASC;`;
    const values = [uid];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows; })
        .catch((e) => { console.log(e); return []; });
}

// returns success
exports.join_auction_user = async function (user_id, auction_id) {

    // schvalen defaults to false
    const q = `
    INSERT INTO ucastnik(IDUzivatele, IDaukce) 
        SELECT x::INT, y::INT FROM (VALUES($1, $2)) AS v (x, y)
    WHERE EXISTS (SELECT * FROM aukce WHERE CisloAukce = $3 AND get_auction_status(CisloAukce) IN ('schvalena', 'probihajici'))
        AND NOT EXISTS (SELECT * FROM aukce WHERE CisloAukce = $4 AND (Licitator = $5 OR Autor = $6));`;
    const values = [user_id, auction_id, auction_id, auction_id, user_id, user_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rowCount == 1; })
        .catch((e) => { console.log(e); return false; });
}

// returns can_joins
exports.can_join_user = async function (user_id, auction_id) {

    const q = `SELECT can_join($1, $2)`;
    const values = [user_id, auction_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows[0].can_join; })
        .catch((e) => { console.log(e); return false; });
}

// returns array of auctions
exports.user_can_join_auctions = async function (uid, auctions) {
    const q = `
    SELECT can_join($1, cisloaukce) as can_join, cisloaukce 
    FROM aukce 
    WHERE cisloaukce = ANY ($2::int[])`;
    const values = [uid, auctions];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows; })
        .catch((e) => { console.log(e); return undefined; });
}

// returns success
// can not leave after start
exports.leave_auction_user = async function (user_id, auction_id) {

    // schvalen defaults to false
    const q = `
    DELETE FROM ucastnik 
    WHERE IDaukce = $1 AND IDUzivatele = $2 AND 'schvalena' = (SELECT Stav from aukce WHERE CisloAukce = $1);`;
    const values = [auction_id, user_id];

    return await db.query(q, values)
        .then((query_res) => { return query_res.rowCount == 1; })
        .catch((e) => {
            console.log(e);
            return false;
        });
}

// returns auctions user participates in
exports.get_auctions_user_participates = async function (uid) {

    const q = `
    SELECT schvalen, CisloAukce, cena, aukce.Nazev, Autor, get_username(Autor) as AutorUsername, 
        Pravidlo, Typ, ZacatekAukce, KonecAukce, get_auction_status(CisloAukce) as Stav
    FROM ucastnik
    LEFT JOIN aukce 
        ON aukce.cisloaukce = ucastnik.idaukce
    WHERE ucastnik.IDUzivatele = $1 
    ORDER BY ucastnik.idaukce ASC ;`;
    const values = [uid];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows; })
        .catch((e) => { console.log(e); return []; });
}

// returns participation data
exports.get_user_participation = async function (uid, auction_id) {

    const q = `
    SELECT EXISTS(SELECT * FROM ucastnik WHERE IDaukce = $1 AND IDUzivatele = $2);`;
    const values = [auction_id, uid];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows[0].exists; })
        .catch((e) => { console.log(e); return undefined; });
}

// returns true if user can place a bid, doesnt check amount
exports.can_bid = async function (uid, auction_id) {

    const q = `
    SELECT EXISTS(
        SELECT *
        FROM ucastnik 
        WHERE 
            IDaukce = $2 
            AND get_auction_status(IDaukce) = 'probihajici'
            AND ucastnik.IDUzivatele = $1 
            AND ucastnik.Schvalen
    );`;
    const values = [uid, auction_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows[0].exists; })
        .catch((e) => { console.log(e); return false; });
}

// returns true if user can place a bid, checks amount as well
exports.valid_bid = async function (auction_id, bid, object) {

    const q = `
    SELECT EXISTS(
        SELECT 1 
        FROM aukce 
        INNER JOIN ucastnik 
            ON aukce.CisloAukce = ucastnik.IDaukce
        WHERE aukce.CisloAukce = $1 AND 
            ((aukce.pravidlo = 'uzavrena') OR (aukce.typ = 'poptavkova') OR (aukce.typ = 'nabidkova' AND $2 - aukce.Cena >= aukce.MinPrihoz))
    );`;
    const values = [auction_id, bid];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows[0].exists; })
        .catch((e) => { console.log(e); return false; });
}

// returns [success of prihoz, success of cena update]
// doeasnt check anything, use valid_bid
// updates aukce row
exports.new_bid = async function (uid, auction_id, amount, objekt) {

    const q = `
    INSERT INTO prihoz(Ucastnik, IDaukce, Castka, Objekt) 
    VALUES($1, $2, $3, $4);`;
    const values = [uid, auction_id, amount, objekt];

    const q2 = `
    UPDATE aukce 
    SET Cena = CASE
        WHEN pravidlo = 'uzavrena' AND typ = 'nabidkova' THEN GREATEST(Cena, $2)
        WHEN pravidlo = 'uzavrena' AND typ = 'poptavkova' THEN LEAST(Cena, $2)
        WHEN pravidlo = 'otevrena' AND typ = 'nabidkova' THEN $2
        WHEN pravidlo = 'otevrena' AND typ = 'poptavkova' THEN LEAST(Cena, $2)
        ELSE NULL
        END
    WHERE CisloAukce = $1`;
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

    const q = `
    UPDATE aukce SET foto_url = $2 
    WHERE cisloaukce = $1`;
    const values = [auction_id, picture_link];

    return db.query(q, values)
        .then((query_res) => { return query_res.rowCount == 1; })
        .catch((e) => { console.log(e); return false; });
}

exports.add_tags = async function (auction_id, tags) {

    const q = `
    INSERT INTO aukce_tag(IDaukce, IDTag) 
    VALUES($1, tag_name_get_id($2));`;

    let promises = [];
    for (let tag of tags) {
        const values = [auction_id, tag];
        promises.push(
            db.query(q, values).then((query_res) => { return query_res.rowCount == 1; })
        )
    }

    return promises;
}
