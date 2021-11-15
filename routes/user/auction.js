var appRoot = require('app-root-path');
const express = require('express');
const auth = require(appRoot + '/authorization');
const bcrypt = require('bcrypt');

const db_users = require(appRoot + '/db/users');
const db_auction = require(appRoot + '/db/auction');

const router = express.Router();

// sub-tree requires login
router.use(auth.login);

// request to join the auction
// example:
// POST /join
router.post('/join', async (req, res) => {

    const id = req.auction_id;

    const auction_id = parseInt(id);

    if (isNaN(auction_id)) {
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }

    const success = await db_auction.join_auction_user({ user_id: req.session.uid, auction_id });
    if (success) {
        return res.send({ success: true, message: "Request submitted" });
    } else {
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
})

// leave the auction
// example:
// POST /leave
router.delete('/leave', async (req, res) => { // todo cant leave after start

    const id = req.auction_id;

    const rows_deleted = await db_auction.leave_auction_user(req.session.uid, id);
    if (rows_deleted == 1) {
        return res.send({ success: true, message: "Left auction" });
    } else if (rows_deleted == 0) {
        return res.status(400).send({ success: false, message: "Cannot leave auction (not in it or already started)" });
    } else {
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
})

// create new bid
// example:
// POST /bid
// {
//     "bid": 1200000
// }
router.post('/bid', async (req, res) => { // todo cant leave after start

    const auction_id = req.auction_id;
    const amount = req.body.bid;

    if (isNaN(amount)) {
        return res.status(400).send({ success: false, message: "Neplatný požadavek - must include bid: number" });
    }

    // is user part of auction and is auction live?
    const can_bid = await db_auction.can_bid(req.session.uid, auction_id, amount); // todo all req.session.uid to req.user.something

    if (!can_bid) {
        return res.status(400).send({ success: false, message: "Neplatný požadavek" }); // cannot bid in this auction or low bid
    }

    const [prom1, prom2] = await db_auction.new_bid(req.session.uid, auction_id, amount);
    const rows1 = await prom1; // todo promise.all?
    const rows2 = await prom2;

    if (rows1 == 1 && rows2 == 1) {
        console.log(`New bid from user ${req.session.uid}: ${amount}`);
        return res.send({ success: true, message: `Bid ${amount}` });
    } else {
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
})

module.exports = router;
