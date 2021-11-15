var appRoot = require('app-root-path');
const express = require('express');
const auth = require(appRoot + '/authorization');
const bcrypt = require('bcrypt');

const db_users = require(appRoot + '/db/users');
const db_auction = require(appRoot + '/db/auction');

const router = express.Router();

// get the highest bid in auction
// example:
// GET /max-bid
router.get('/max-bid', async (req, res) => {

    const auction_id = req.auction_id;

    const max_bid_amount = await db_auction.max_bid(auction_id);
    return res.send({ success: true, message: "Maximal bid", data: max_bid_amount });
})

// get the highest bid in auction
// example:
// GET /max-bid
router.get('/bids', async (req, res) => {

    const auction_id = req.auction_id;

    const bids = await db_auction.get_bids(auction_id);
    return res.send({ success: true, message: "Auction bids", data: bids });
})

// get auction information
// example:
// GET /
router.get('/', async (req, res) => {

    const auction_id = req.auction_id;

    const auction = await db_auction.get_auction(auction_id);
    if (auction) {
        return res.send({ success: true, message: "Auction data", data: auction });
    } else {
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
})

module.exports = router;
