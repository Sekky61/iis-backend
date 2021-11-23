var appRoot = require('app-root-path');
const db = require(appRoot + '/postgres_util').get_db();
const common = require(appRoot + '/common');

// returns public auctions (stav != 'zamitnuta' or '')
exports.get_public_auctions = async function (offset, number) { // todo join object // todo find if select is stable and mby sort auctions 

    // todo join with object, here or in backend logic
    const q = `SELECT CisloAukce, cena, Nazev, Autor, get_username(Autor) as AutorUsername, 
    Pravidlo, Typ, ZacatekAukce, KonecAukce, get_auction_status(CisloAukce) as Stav,
    ARRAY(SELECT tag.nazev FROM aukce_tag, tag WHERE aukce_tag.IDaukce = CisloAukce AND aukce_tag.idtag = tag.idtag) as tagy, 
    Adresa, Popis, foto_url
    FROM aukce 
    WHERE get_auction_status(CisloAukce) IN ('schvalena', 'probihajici', 'ukoncena') ORDER BY aukce.CisloAukce ASC LIMIT $1 OFFSET $2`;
    const values = [number, offset];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows; })
        .catch((e) => { console.log(e); return []; });
}

// returns auction info
exports.get_auction = async function (auction_id) {
    // todo nacist objekt (predmet aukce)
    const q = `
        SELECT CisloAukce, Cena, Nazev, Autor, get_username(Autor) as AutorUsername, Pravidlo, Typ, ZacatekAukce, KonecAukce, MinPrihoz,
        get_auction_status(CisloAukce) as stav,
        ARRAY(SELECT tag.nazev FROM aukce_tag, tag WHERE aukce_tag.IDaukce = $1 AND aukce_tag.idtag = tag.idtag) as tagy, Adresa, Popis, foto_url
        FROM aukce 
        WHERE CisloAukce = $2 ORDER BY aukce.CisloAukce ASC;`;
    const values = [auction_id, auction_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows[0]; })
        .catch((e) => { console.log(e); return undefined; });
}

// returns participants
exports.get_participants = async function (auction_id) {

    const q = `SELECT uzivatel.id, schvalen, username, jmeno, prijmeni, email 
    FROM ucastnik, uzivatel
    WHERE ucastnik.IDaukce = $1 AND ucastnik.IDUzivatele = uzivatel.id ORDER BY uzivatel.id ASC ;`;
    const values = [auction_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows; })
        .catch((e) => { console.log(e); return []; });
}

// returns highest bid of auction
exports.max_bid = async function (auction_id) {

    const q = `SELECT MAX(Castka) FROM prihoz WHERE IDaukce = $1`;
    const values = [auction_id];

    return db.query(q, values)
        .then((query_res) => { if (query_res.rowCount > 0) { return query_res.rows[0]; } else { return null; } })
        .catch((e) => { console.log(e); return null; });
}

// returns all bids of auction
exports.get_bids = async function (auction_id) {

    const q = `SELECT Castka, Username FROM prihoz, uzivatel 
    WHERE prihoz.Ucastnik = uzivatel.id AND IDaukce = $1 ORDER BY Castka DESC`;
    const values = [auction_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows; })
        .catch((e) => { console.log(e); return []; });
}
