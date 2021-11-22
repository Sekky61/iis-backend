var appRoot = require('app-root-path');
const express = require('express');
const auth = require(appRoot + '/authorization');

const db_users = require(appRoot + '/db/users');
const db_auction = require(appRoot + '/db/auction');

const router = express.Router();

// sub-tree requires login
router.use(auth.login);

// file upload

const multer = require('multer')
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'photos/')
    },
    filename: function (req, file, cb) {
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9)
        // todo get suffix from .originalname
        const fileExt = file.originalname.split('.').pop();
        cb(null, file.fieldname + '-' + uniqueSuffix + '.' + fileExt)
    }
})

const upload = multer({ storage: storage })

// upload photo to auction
// example:
// POST /upload-photo
router.post('/upload-photo', upload.single('photo'), async (req, res) => {

    const filename = req.file.filename;

    const success = await db_auction.save_picture_link(req.auction_id, filename);
    if (success) {
        console.log(`File uploaded`);
        return res.send({ success: true, message: "Soubor nahrán" });
    } else {
        console.log(`File upload failed`);
        return res.status(400).send({ success: false, message: "Soubor se nepodařilo nahrát" });
    }
})

// can user join this auction? Author, licit and somebody already joined cannot join
// example:
// GET /can-join
router.get('/can-join', async (req, res) => {

    const can_join = await db_auction.can_join_user(req.user.id, req.auction_id);
    if (can_join) {
        console.log(`User #${req.user.id} can join auction ${req.auction_id}`);
        return res.send({ success: true, message: "Máte oprávnění připojit se do této aukce" });
    } else {
        console.log(`User #${req.user.id} cannot join auction ${req.auction_id}`);
        return res.send({ success: false, message: "Nemůžete se připojit do této aukce" });
    }
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
