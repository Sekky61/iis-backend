const express = require('express');
const auth = require('../../authorization');
const bcrypt = require('bcrypt');

const common = require('../../common');
const db_users = require('../../db/users');
const db_auction = require('../../db/auction');

let router = express.Router();

router.use(auth.login);
router.use(auth.licit);

// sign up to auction as licitator
// example:
// POST 
router.post('/join', async (req, res) => {
    let id = req.auction_id;

    // request contains session data
    let rows_affected = await db_auction.join_auction_licit(req.session.uid, id);
    if (rows_affected != 1) {
        console.log(rows_affected);
        return res.status(400).send({ success: false, message: "Invalid request" });
    }
    res.send({ success: true, message: "Added as licitator" });
})

// confirm users request to join auction
// example:
// POST 
// {
//     "user_id": 1
// }
router.post('/confirm', async (req, res) => { // todo test
    let { user_id } = req.body;
    let auction_id = req.auction_id;

    console.log(user_id, auction_id);

    // request contains session data
    let rows_affected = await db_auction.confirm_participant(user_id, auction_id);
    if (rows_affected != 1) {
        console.log(rows_affected);
        return res.status(400).send({ success: false, message: "Invalid request" });
    }
    res.send({ success: true, message: "User confirmed" });
})

// list participants
// example:
// GET
router.get('/list-participants', async (req, res) => { // todo lists everybody
    // todo return 400 if auction does not exist
    let auction_id = req.auction_id;
    let rows = await db_auction.get_participants(auction_id);
    return res.send({ success: true, message: "Auction participants", data: rows });
})

module.exports = router;
