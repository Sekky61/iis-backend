var appRoot = require('app-root-path');
const express = require('express');
const auth = require(appRoot + '/authorization');
const bcrypt = require('bcrypt');

const validation = require(appRoot + '/validation');

const db_users = require(appRoot + '/db/users');
const db_auction = require(appRoot + '/db/auction');

const router = express.Router();

// sub-tree requires login
router.use(auth.login);

// set password
// example:
// POST 
// { 
//     "old_password": "12345a", 
//     "new_password": "1234567a", 
// }
router.post('/set-password', async (req, res) => {

    const { old_password, new_password } = req.body;

    const saltRounds = 12;
    const old_pass_matches = await bcrypt.compare(old_password, req.user.heslo);

    if (old_pass_matches) {
        // old passwords match, set new one
        const new_hash = await bcrypt.hash(new_password, saltRounds);
        db_users.set_user_property(req.user.id, 'Heslo', new_hash);
        console.log(`Password change`);
        return res.send({ success: true, message: "Heslo změněno" });
    } else {
        console.log(`Password change failed`);
        return res.status(400).send({ success: false, message: "Špatné heslo" });
    }
})

// add auction
// example:
// POST 
// {
// 	"nazev": "Chata za mestem",
// 	"vyvolavaci_cena": 150000,
//  "min_prihoz": 5000,
//  "object": 1,
//  "pravidlo": "otevrena",
//  "typ": "nabidkova",
//  "min_ucastniku": 2
// }
router.post('/auction', async (req, res) => {

    let { nazev, vyvolavaci_cena, min_prihoz, object, pravidlo, typ, min_ucastniku } = req.body;

    if (min_ucastniku === undefined || min_ucastniku === null) {
        min_ucastniku = 1;
    }

    const auction_obj = {
        autor: req.user.id,
        nazev,
        vyvolavaci_cena,
        min_prihoz,
        object,
        pravidlo,
        typ,
        min_ucastniku,
        stav: 'neschvalena',
    };

    const is_valid = validation.new_auction(auction_obj);
    if (!is_valid) {
        console.log(`Add auction invalid values`);
        return res.status(400).send({ success: false, message: "Špatné hodnoty" });
    }

    const result = await db_auction.create_auction(auction_obj);
    if (result) {
        console.log(`Auction added`);
        return res.send({ success: true, message: "Aukce přidána" });
    } else {
        console.log(`Add auction invalid values`);
        return res.status(400).send({ success: false, message: "Špatné hodnoty" });
    }
})

// list auctions user is part of
// example:
// GET
router.get('/auctions-member', async (req, res) => {

    const rows = await db_auction.get_auctions_user_participates(req.user.id);
    return res.send({ success: true, message: "Zúčastněné aukce", data: rows }); // todo message?
})

// list users auctions (author) 
// example:
// GET
router.get('/my-auctions', async (req, res) => {

    const rows = await db_auction.get_my_auctions(req.user.id);
    return res.send({ success: true, message: "Mé Aukce", data: rows });
})

module.exports = router;
