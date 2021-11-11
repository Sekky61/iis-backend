var appRoot = require('app-root-path');
const express = require('express');
const auth = require(appRoot + '/authorization');
const bcrypt = require('bcrypt');

const common = require(appRoot + '/common');
const db_users = require(appRoot + '/db/users');
const db_auction = require(appRoot + '/db/auction');

const router = express.Router();

router.use(auth.login);
router.use(auth.licit);

// sign up to auction as licitator
// example:
// POST 
router.post('/join', async (req, res) => {
    const id = req.auction_id;

    // request contains session data
    const rows_affected = await db_auction.join_auction_licit(req.session.uid, id);
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
    const { user_id } = req.body;
    const auction_id = req.auction_id;

    console.log(user_id, auction_id);

    // check if licit has rights to auction
    const licit_id = await db_auction.get_licit(auction_id);
    if (licit_id !== req.session.uid) {
        console.log(`User ${req.session.uid} tried to manipulate auction ${auction_id}, but licit is ${licit_id}`);
        return res.status(400).send({ success: false, message: "Not authorized" }); // todo return code?
    }

    // request contains session data
    const rows_affected = await db_auction.confirm_participant(user_id, auction_id);
    if (rows_affected != 1) {
        console.log("ra " + rows_affected);
        return res.status(400).send({ success: false, message: "Invalid request" });
    }
    res.send({ success: true, message: "User confirmed" });
})

// start the auction
// example:
// POST 
router.post('/start', async (req, res) => { // todo test
    const id = req.auction_id;

    // request contains session data
    const participants = await db_auction.get_participants(id);
    const rows_affected = await db_auction.start_auction_licit(req.session.uid, id, participants);
    if (rows_affected != 1) {
        console.log(rows_affected);
        return res.status(400).send({ success: false, message: "Invalid request" });
    }
    res.send({ success: true, message: "Auction started" });
})

// list participants
// example:
// GET
router.get('/list-participants', async (req, res) => { // todo lists everybody
    // todo return 400 if auction does not exist
    const auction_id = req.auction_id;
    const rows = await db_auction.get_participants(auction_id);
    return res.send({ success: true, message: "Auction participants", data: rows });
})

module.exports = router;
