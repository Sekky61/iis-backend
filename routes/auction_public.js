var appRoot = require('app-root-path');
const express = require('express');
const db_auction = require(appRoot + '/db/auction');

const router = express.Router();

// get all bids in auction
// bids in auctions with 'uzavrena' rule are not visible
// example:
// GET /bids
router.get('/bids', async (req, res) => {

    if (req.auction.pravidlo == 'uzavrena') {
        return res.status(400).send({ success: false, message: "Aukce je uzavřená" });
    }

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

// get auction photo
// example:
// GET /photo
router.get('/photo', async (req, res) => {

    const auction = await db_auction.get_auction(req.auction_id);

    if (!auction) {
        console.log(`Failed to get auction #${req.auction_id}`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }

    const pic_url = auction.foto_url;

    console.log(`Get picture of auction #${req.auction_id}`);
    return res.sendFile(pic_url);

})

module.exports = router;
