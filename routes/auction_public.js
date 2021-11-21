var appRoot = require('app-root-path');
const express = require('express');
const db_auction = require(appRoot + '/db/auction');

const router = express.Router();

// get the highest bid in auction
// example:
// GET /max-bid
router.get('/max-bid', async (req, res) => {

    const max_bid_amount = await db_auction.max_bid(req.auction_id);
    if (max_bid_amount) {
        console.log(`Max bid auction #${req.auction_id}: ${max_bid_amount}`);
        return res.send({ success: true, message: "Nejvyšší příhoz", data: max_bid_amount });
    } else {
        console.log(`Max bid auction #${req.auction_id}: auction does not exist`);
        return res.status(400).send({ success: false, message: "Aukce neexistuje" });
    }
})

// get allt bids in auction
// example:
// GET /bids
router.get('/bids', async (req, res) => {

    const bids = await db_auction.get_bids(req.auction_id);
    console.log(`List bids auction #${req.auction_id}`);
    return res.send({ success: true, message: "Auction bids", data: bids });
})

// get auction information
// example:
// GET /
router.get('/', async (req, res) => {

    const auction = await db_auction.get_auction(req.auction_id);
    if (auction) {
        console.log(`List auction #${req.auction_id}`);
        return res.send({ success: true, message: "Auction data", data: auction });
    } else {
        console.log(`Failed to list auction #${req.auction_id}`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
})

module.exports = router;
