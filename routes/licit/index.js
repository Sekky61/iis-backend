var appRoot = require('app-root-path');
const express = require('express');
const auth = require(appRoot + '/authorization');
const db_auction = require(appRoot + '/db/auction');
const validation = require(appRoot + '/validation');

const router = express.Router();

router.use(auth.login);
router.use(auth.licit);

// detailed list of auctions
// example:
// GET .../auctions?offset=0?number=2
router.get('/auctions', async (req, res) => {

    // query params
    const query_valid = validation.range_query(req.query);

    if (!query_valid) {
        console.log(`List auctions: invalid query`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }

    const offset = parseInt(req.query.offset);
    const number = parseInt(req.query.number);

    const auctions = await db_auction.list_auctions_full(offset, number);
    console.log(`List auctions ${offset}-${offset + number - 1}`);
    return res.send({ success: true, message: `Aukce ${offset}-${offset + number - 1}`, data: auctions });
})

// list of auctions licitator is part of
// example:
// GET .../my-auctions
router.get('/my-auctions', async (req, res) => {

    const auctions = await db_auction.list_auctions_licit(req.user.id);
    console.log(`List auctions he figures as licitator in`);
    return res.send({ success: true, message: `Vaše aukce`, data: auctions });
})


// list of auctions licitator is part of
// example:
// GET .../my-auctions
router.get('/all-unconfirmed-participants', async (req, res) => {

    const participants = await db_auction.list_all_unconfirmed_participants(req.user.id);
    console.log(`List all participants`);
    return res.send({ success: true, message: `Všichni účastníci`, data: participants });
})

module.exports = router; // todo defaults
