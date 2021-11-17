var appRoot = require('app-root-path');
const express = require('express');
const auth = require(appRoot + '/authorization');

const db_auction = require(appRoot + '/db/auction');

const router = express.Router();

router.use(auth.login);
router.use(auth.licit); // todo authorization to act on this auction as licit

// sign up to auction as licitator
// example:
// POST 
router.post('/join', async (req, res) => {

    const success = await db_auction.join_auction_licit(req.user.id, req.auction_id);
    if (success) {
        console.log(`Joined auction #${req.auction_id}: success`);
        return res.send({ success: true, message: "Registrován jako licitátor" });
    } else {
        console.log(`Joined auction #${req.auction_id}: failed`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
})

// confirm users request to join auction
// example:
// POST 
// {
//     "user_id": 1
// }
router.post('/confirm', async (req, res) => {
    const { user_id } = req.body;

    const success = await db_auction.confirm_participant(user_id, req.user.id, req.auction_id);
    if (success) {
        console.log(`Confirmed user #${req.user.id}: success`);
        res.send({ success: true, message: "Uživatel potvrzen" });
    } else {
        console.log(`Confirmed user #${req.user.id}: failed`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
})

// start the auction
// example:
// POST 
router.post('/start', async (req, res) => { // todo test
    const auction_id = req.auction_id;

    // request contains session data
    const success = await db_auction.start_auction_licit(req.user.id, req.auction_id);
    if (success) {
        console.log(`Start auction #${req.auction_id}: success`);
        return res.send({ success: true, message: "Aukce odstartována" });
    } else {
        console.log(`Start auction #${req.auction_id}: failed`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
})

// list participants
// example:
// GET
router.get('/list-participants', async (req, res) => {
    // todo return 400 if auction does not exist
    const auction_exists = await db_auction.auction_exists(req.auction_id);
    if (auction_exists) {
        const rows = await db_auction.get_participants(req.auction_id);
        console.log(`Listing participants: auction #${req.auction_id}`);
        return res.send({ success: true, message: "Účastníci aukce", data: rows });
    } else {
        console.log(`Listing participants: auction #${req.auction_id} doesn't exist`);
        return res.status(400).send({ success: false, message: "Aukce neexistuje" });
    }
})

module.exports = router;
