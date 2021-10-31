const express = require('express');
const auth = require('../../authorization');
const bcrypt = require('bcrypt');

const db_users = require('../../db/users');
const db_auction = require('../../db/auction');

let router = express.Router();

// sub-tree requires login
router.use(auth.login);

// demo
router.get('/demo', async (req, res) => {
    return res.send(`Yes I can see you are logged in mr. ${req.user.username}`);
})

// set password
// example:
// POST 
// { 
//     "old_password": "12345a", 
//     "new_password": "1234567a", 
// }
router.post('/set-password', async (req, res) => {

    let { old_password, new_password } = req.body;
    let user = await db_users.get_user_by_id(req.session.uid);

    const saltRounds = 12;
    let old_pass_matches = await bcrypt.compare(old_password, user.heslo);

    if (old_pass_matches) {
        // old passwords match, set new one
        const new_hash = await bcrypt.hash(new_password, saltRounds);
        db_users.set_user_property(req.session.uid, 'Heslo', new_hash);
        return res.send({ success: true, message: "Heslo změněno" });
    } else {
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

    if (!min_ucastniku) {
        min_ucastniku = 1;
    }

    let auction_obj = {
        autor: req.session.uid,
        nazev,
        vyvolavaci_cena,
        min_prihoz,
        object,
        pravidlo,
        typ,
        min_ucastniku,
        stav: 'neschvalena',
    };

    await db_auction.create_auction(auction_obj);

    return res.send(`Auction added`);
})

// request to join the auction
// example:
// POST /auction/1/join
router.get('/auctions', async (req, res) => {

    let rows = await db_auction.get_auctions(req.session.uid);
    return res.send(rows);
})

module.exports = router;
