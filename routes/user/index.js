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
// POST { "new_password": "1234567a" }
router.post('/set-password', async (req, res) => {

    let { new_password } = req.body;

    const saltRounds = 12;
    const hash = await bcrypt.hash(new_password, saltRounds);

    console.log(hash);

    db_users.set_user_property(req.session.uid, 'Heslo', hash);

    return res.send(`Password changed`);
})

// add auction
// example:
// POST 
// { 
//   "new_password": "1234567a" 
// }
router.post('/auction', async (req, res) => {

    // const values = [auction_obj.nazev,
    //     auction_obj.vyvolavaci_cena,
    //     auction_obj.min_prihoz,
    //     auction_obj.object,
    //     auction_obj.pravidlo,
    //     auction_obj.typ,
    //     auction_obj.min_ucastniku,
    //     auction_obj.stav
    //     ];

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

module.exports = router;
