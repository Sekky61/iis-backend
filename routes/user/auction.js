var appRoot = require('app-root-path');
const express = require('express');
const auth = require(appRoot + '/authorization');

const db_users = require(appRoot + '/db/users');
const db_auction = require(appRoot + '/db/auction');

const router = express.Router();

// sub-tree requires login
router.use(auth.login);

// request to join the auction
// example:
// POST /join
router.post('/join', async (req, res) => {

    const success = await db_auction.join_auction_user(req.user.id, req.auction_id);
    if (success) {
        console.log(`Joined auction #${req.auction_id}`);
        return res.send({ success: true, message: "Požadavek zaslán" });
    } else {
        console.log(`Failed joining auction #${req.auction_id}`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
})

// leave the auction
// example:
// POST /leave
router.delete('/leave', async (req, res) => {

    const success = await db_auction.leave_auction_user(req.user.id, req.auction_id);
    if (success) {
        console.log(`Left auction #${req.auction_id}`);
        return res.send({ success: true, message: "Aukce opuštěna" });
    } else {
        console.log(`Failed leaving auction #${req.auction_id}`);
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

    const amount = req.body.bid;

    if (isNaN(amount)) {
        console.log(`Failed to bid to auction #${req.auction_id}: bad value`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek - příhoz musí být číslo" });
    }

    // is user part of auction and is auction live?
    const can_bid = await db_auction.can_bid(req.user.id, req.auction_id, amount);

    if (!can_bid) {
        console.log(`Failed to bid to auction #${req.auction_id}`);
        return res.status(400).send({ success: false, message: "Nemáte oprávnění přihazovat" }); // cannot bid in this auction or low bid
    }

    const [prom1, prom2] = await db_auction.new_bid(req.user.id, req.auction_id, amount);
    const success1 = await prom1; // todo promise.all?
    const success2 = await prom2;

    if (success1 && success2) {
        console.log(`New bid to auction #${req.auction_id}: ${amount}`);
        return res.send({ success: true, message: `Příhoz ${amount}Kč` });
    } else {
        console.log(`Failed to bid to auction #${req.auction_id}`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
})

module.exports = router;
