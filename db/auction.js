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