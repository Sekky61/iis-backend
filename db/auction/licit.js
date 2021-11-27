var appRoot = require('app-root-path');
const db = require(appRoot + '/postgres_util').get_db();

// returns success
exports.join_auction_licit = async function (licit_id, auction_id) {

    const q = `
    UPDATE aukce SET Licitator = $1, Stav = 'schvalena' 
    WHERE CisloAukce = $2 AND Stav = 'neschvalena' AND Licitator IS NULL AND Autor != $1;`;
    const values = [licit_id, auction_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rowCount == 1; })
        .catch((e) => { console.log(e); return false; });
}

// returns success
exports.auction_pick_winner = async function (winner_id, auction_id) { // todo check winner is participant

    const q = `
    UPDATE aukce SET Stav = 'vyhodnocena', Vitez = $1
    WHERE CisloAukce = $2 AND get_auction_status(CisloAukce) = 'ukoncena';`;
    const values = [winner_id, auction_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rowCount == 1; })
        .catch((e) => { console.log(e); return false; });
}

// returns success
// can only reject an auction if it hasn't been started
exports.reject_auction = async function (auction_id) {

    const q = `
    UPDATE aukce SET Stav = 'zamitnuta' 
    WHERE CisloAukce = $1 AND (Stav = 'neschvalena' OR Stav = 'schvalena');`;
    const values = [auction_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rowCount == 1; })
        .catch((e) => { console.log(e); return false; });
}

// returns success
exports.confirm_participant = async function (user_id, licit_id, auction_id) {

    const q = `
    UPDATE ucastnik SET schvalen = TRUE 
    WHERE IDUzivatele = $1 AND schvalen = FALSE AND IDaukce = $2 
        AND $3 = (SELECT Licitator FROM aukce WHERE CisloAukce = $2);`;
    const values = [user_id, auction_id, licit_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rowCount == 1; })
        .catch((e) => { console.log(e); return false; });
}

// returns success
exports.start_auction_licit = async function (licit_id, auction_id) { //todo minpocetucastniku nefunguje todo

    const q = `
    UPDATE aukce SET Stav = 'probihajici', ZacatekAukce = NOW(), KonecAukce = NOW() + DelkaAukce 
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

    const q = `
    SELECT cisloaukce, Autor, get_username(Autor) as AutorUsername, aukce.Nazev, 
        VyvolavaciCena, Cena, MinPrihoz, Pravidlo, Typ, MinPocetUcastniku, 
        licitator, get_username(licitator) as LicitatorUsername, get_auction_status(CisloAukce) as stav, 
        delkaaukce, zacatekaukce, konecaukce, number_of_checked_participants(CisloAukce) as PocetSchvalenychUcastniku,
        objekt.nazev as objekt_nazev, objekt.Adresa, objekt.Popis, objekt.foto_url
    FROM aukce
    LEFT JOIN objekt 
        ON aukce.objekt = objekt.idobjektu
    WHERE licitator = $1
    ORDER BY aukce.CisloAukce ASC;`;
    const values = [user_id];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}

// returns auctions array
// more detailed than public query
exports.list_auctions_full = async function () {

    const q = `
    SELECT cisloaukce, Autor, get_username(Autor) as AutorUsername, aukce.Nazev, VyvolavaciCena, Cena, 
        MinPrihoz, Pravidlo, Typ, MinPocetUcastniku, licitator, get_username(licitator) as LicitatorUsername, 
        get_auction_status(CisloAukce) as stav, delkaaukce, zacatekaukce, konecaukce, 
        objekt.nazev as objekt_nazev, objekt.Adresa, objekt.Popis, objekt.foto_url
    FROM aukce
    LEFT JOIN objekt 
        ON aukce.objekt = objekt.idobjektu
    ORDER BY aukce.CisloAukce ASC`;
    const values = [];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}

// returns success
exports.list_all_unconfirmed_participants = async function (licit_id) {

    const q = `
    SELECT cisloaukce, IDuzivatele, get_username(IDuzivatele) as Username, 
        Schvalen, Stav, Typ, Pravidlo, nazev
    FROM ucastnik, aukce
    WHERE ucastnik.IDaukce = aukce.cisloaukce AND aukce.licitator = $1 AND Schvalen = FALSE;`;
    const values = [licit_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows; })
        .catch((e) => { console.log(e); return []; });
}
