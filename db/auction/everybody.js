var appRoot = require('app-root-path');
const db = require(appRoot + '/postgres_util').get_db();
const common = require(appRoot + '/common');

// returns public auctions (stav != 'zamitnuta' or '')
exports.get_public_auctions = async function (offset, number) { // todo join object // todo find if select is stable and mby sort auctions 

    // todo join with object, here or in backend logic
    const q = `SELECT CisloAukce, cena, aukce.Nazev, Autor, get_username(Autor) as AutorUsername, 
    Pravidlo, Typ, ZacatekAukce, KonecAukce, get_auction_status(CisloAukce) as Stav,
    ARRAY(SELECT tag.nazev FROM aukce_tag, tag WHERE aukce_tag.IDaukce = CisloAukce AND aukce_tag.idtag = tag.idtag) as tagy, 
    objekt.nazev, objekt.Adresa, objekt.Popis, objekt.foto_url
    FROM aukce, objekt
    WHERE aukce.objekt = objekt.idobjektu AND get_auction_status(CisloAukce) IN ('schvalena', 'probihajici', 'ukoncena') ORDER BY aukce.CisloAukce ASC LIMIT $1 OFFSET $2`;
    const values = [number, offset];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows; })
        .catch((e) => { console.log(e); return []; });
}

// returns auction info
exports.get_auction = async function (auction_id) {
    // todo nacist objekt (predmet aukce)
    const q = `
        SELECT CisloAukce, Cena, aukce.Nazev, Autor, get_username(Autor) as AutorUsername, Pravidlo, Typ, ZacatekAukce, KonecAukce, MinPrihoz,
        get_auction_status(CisloAukce) as stav, Licitator, get_username(Licitator) as LicitatorUsername,
        ARRAY(SELECT tag.nazev FROM aukce_tag, tag WHERE aukce_tag.IDaukce = $1 AND aukce_tag.idtag = tag.idtag) as tagy, 
        objekt.nazev as objekt_nazev, objekt.Adresa, objekt.Popis, objekt.foto_url
        FROM aukce, objekt
        WHERE aukce.objekt = objekt.idobjektu AND CisloAukce = $2 ORDER BY aukce.CisloAukce ASC;`;
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

// returns all bids of auction
exports.get_bids = async function (auction_id) {

    const q = `SELECT Castka, Username, objekt FROM prihoz, uzivatel 
    WHERE prihoz.Ucastnik = uzivatel.id AND IDaukce = $1 ORDER BY Castka DESC`;
    const values = [auction_id];

    return db.query(q, values)
        .then((query_res) => { return query_res.rows; })
        .catch((e) => { console.log(e); return []; });
}
