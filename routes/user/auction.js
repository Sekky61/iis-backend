var appRoot = require('app-root-path');
const express = require('express');
const auth = require(appRoot + '/authorization');

const db_auction = require(appRoot + '/db/auction');

const router = express.Router();

// sub-tree requires login
router.use(auth.login);

// is user participating in the auction?
// example:
// GET /is-participating
router.get('/is-participating', async (req, res) => {

    const participates = await db_auction.get_user_participation(req.user.id, req.auction_id);
    if (participates) {
        console.log(`User #${req.user.id} participates in auction ${req.auction_id}`);
        return res.send({ success: true, message: "Uživatel se účastní této aukce", data: participates });
    } else {
        console.log(`User #${req.user.id} does not participate in auction ${req.auction_id}`);
        return res.send({ success: true, message: "Uživatel se neúčastní této aukce", data: null });
    }
})

// can user join this auction? Author, licit and somebody already joined cannot join
// example:
// GET /can-join
router.get('/can-join', async (req, res) => {

    console.log(req.user.id);
    console.log(req.auction);

    const can_join = await db_auction.can_join_user(req.user.id, req.auction_id);
    console.log(`User #${req.user.id} can join auction ${req.auction_id}? ${can_join}`);
    return res.send({ success: true, message: `${can_join ? 'Můžete' : 'Nemůžete'} se připojit`, data: can_join });
})

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
// OR with object
// {
//     "bid": 1200000,
//     "object": 5
// }
router.post('/bid', async (req, res) => { // todo object bids

    const { bid, object } = req.body;
    const amount = bid;

    if (isNaN(amount)) {
        console.log(`Failed to bid to auction #${req.auction_id}: bad value`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek - příhoz musí být číslo" });
    }

    if (!object && req.auction.typ == 'poptavkova') {
        console.log(`Failed to bid to auction #${req.auction_id}: 'poptavkova' aukce no object`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek - příhozy poptávkové aukce musí obsahovat objekt" });
    }

    // is user part of auction and is auction live?
    const can_bid = await db_auction.can_bid(req.user.id, req.auction_id);
    const valid_bid = await db_auction.valid_bid(req.auction_id, amount);

    if (!can_bid) {
        console.log(`Failed to bid to auction #${req.auction_id}`);
        return res.status(400).send({ success: false, message: "Nemáte oprávnění přihazovat" }); // cannot bid in this auction
    }

    if (!valid_bid) {
        console.log(`Failed to bid to auction #${req.auction_id}`);
        return res.status(400).send({ success: false, message: "Neplatný příhoz" }); // low bid
    }

    const [prom1, prom2] = await db_auction.new_bid(req.user.id, req.auction_id, amount, object);
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
