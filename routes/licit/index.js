var appRoot = require('app-root-path');
const express = require('express');
const auth = require(appRoot + '/authorization');
const db_auction = require(appRoot + '/db/auction');

const router = express.Router();

router.use(auth.login);
router.use(auth.licit);

// detailed list of auctions
// example:
// GET .../auctions
router.get('/auctions', async (req, res) => {

    const auctions = await db_auction.list_auctions_full();
    console.log(`List auctions`);
    return res.send({ success: true, message: `Aukce`, data: auctions });
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
