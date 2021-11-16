var appRoot = require('app-root-path');
const express = require('express');
const auth = require(appRoot + '/authorization');
const bcrypt = require('bcrypt');

const common = require(appRoot + '/common');
const db_users = require(appRoot + '/db/users');
const db_auction = require(appRoot + '/db/auction');

const router = express.Router();

router.use(auth.login);
router.use(auth.licit); // todo authorization to act on this auction as licit

// sign up to auction as licitator
// example:
// POST 
router.post('/join', async (req, res) => {
    const auction_id = req.auction_id;

    const rows_affected = await db_auction.join_auction_licit(req.user.id, auction_id);
    if (rows_affected != 1) {
        console.log(`Licit: joined auction ${auction_id}: failed`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
    console.log(`Licit: joined auction ${auction_id}: success`);
    return res.send({ success: true, message: "Added as licitator" });
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
    const licit_id = req.user.id;

    // request contains session data
    const rows_affected = await db_auction.confirm_participant(user_id, licit_id, auction_id);
    if (rows_affected != 1) {
        console.log("ra " + rows_affected);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
    res.send({ success: true, message: "User confirmed" });
})

// start the auction
// example:
// POST 
router.post('/start', async (req, res) => { // todo test
    const auction_id = req.auction_id;

    // request contains session data
    const rows_affected = await db_auction.start_auction_licit(req.user.id, auction_id);
    if (rows_affected != 1) {
        console.log(`Licit: start auction ${auction_id}: failed`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
    console.log(`Licit: start auction ${auction_id}: success`);
    return res.send({ success: true, message: "Auction started" });
})

// list participants
// example:
// GET
router.get('/list-participants', async (req, res) => { // todo lists everybody
    // todo return 400 if auction does not exist
    const auction_id = req.auction_id;
    const rows = await db_auction.get_participants(auction_id);
    console.log(`Licit: listing participants: auction ${auction_id}`);
    return res.send({ success: true, message: "Auction participants", data: rows });
})

module.exports = router;
