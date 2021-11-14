var appRoot = require('app-root-path');
const db = require(appRoot + '/postgres_util').get_db();
const common = require(appRoot + '/common');

exports.get_live_auctions = async function (offset, number) { // todo join object

    // todo join with object, here or in backend logic
    const q = `SELECT CisloAukce, 1 AS cena, Nazev, Autor, IDobject, Pravidlo, Typ, ZacatekAukce, KonecAukce, Stav,
    ARRAY(SELECT tag.nazev FROM aukce_tag, tag WHERE aukce_tag.IDaukce = CisloAukce AND aukce_tag.idtag = tag.idtag) as tagy
    FROM aukce WHERE get_auction_status(CisloAukce) IN ('schvalena', 'probihajici') LIMIT $1 OFFSET $2`;
    const values = [number, offset];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}

exports.get_licit = async function (auction_id) {

    const q = `SELECT Licitator FROM aukce WHERE CisloAukce = $1;`;
    const values = [auction_id];

    return db.query(q, values).then((query_res) => { return query_res.rows[0].licitator; });
}

exports.get_auction = async function (auction_id) {
    // todo nacist objekt (predmet aukce)
    const q = `
        SELECT CisloAukce, 123 as Cena, Nazev, Autor, IDobject, Pravidlo, Typ, ZacatekAukce, KonecAukce, 
        ARRAY(SELECT tag.nazev FROM aukce_tag, tag WHERE aukce_tag.IDaukce = $1 AND aukce_tag.idtag = tag.idtag) as tagy
        FROM aukce WHERE CisloAukce = $2;`;
    const values = [auction_id, auction_id];

    return db.query(q, values).then((query_res) => { return query_res.rows[0]; });
}
