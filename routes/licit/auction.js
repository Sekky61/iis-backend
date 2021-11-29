var appRoot = require('app-root-path');
const express = require('express');
const auth = require(appRoot + '/authorization');

const db_auction = require(appRoot + '/db/auction');

const router = express.Router();

router.use(auth.login);
router.use(auth.licit);

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

// pick a winner (stav => vyhodnocena)
// example:
// POST 
// {
//     winner_id: 4
// }
router.post('/evaluate', async (req, res) => { // todo test

    const { winner_id } = req.body;

    if (req.user.id != req.auction.licitator) {
        console.log(`Permission denied (auction #${req.auction_id})`);
        return res.status(400).send({ success: false, message: "Nejste licitátorem této aukce" });
    }

    const participation = await db_auction.get_user_participation(winner_id, req.auction_id);

    if (!participation) {
        console.log("Picked invalid winner")
        return res.status(400).send({ success: false, message: "Uživatel není součástí aukce" });
    }

    if (!participation.schvalen) {
        console.log("Picked invalid winner")
        return res.status(400).send({ success: false, message: "Uživatel není schválen" });
    }

    const success = await db_auction.auction_pick_winner(winner_id, req.auction_id);
    if (success) {
        console.log(`Evaluating auction #${req.auction_id}: success`);
        return res.send({ success: true, message: "Aukce vyhodnocena" });
    } else {
        console.log(`Evaluating auction #${req.auction_id}: failed`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
})

// reject auction - must not be started ('neschvalena' or 'schvalena')
// example:
// POST
router.post('/reject', async (req, res) => {

    const success = await db_auction.reject_auction(req.auction_id);
    if (success) {
        console.log(`Rejected auction #${req.auction_id}`);
        return res.send({ success: true, message: "Aukce zamítnuta" });
    } else {
        console.log(`Rejecting auction #${req.auction_id}: failed`);
        return res.status(400).send({ success: false, message: "Aukci nelze zamítnout" });
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
router.post('/start', async (req, res) => {
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

    const participants = await db_auction.get_participants(req.auction_id);
    console.log(`Listing participants: auction #${req.auction_id}`);
    return res.send({ success: true, message: "Účastníci aukce", data: participants });

})

module.exports = router;
