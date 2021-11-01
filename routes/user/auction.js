const express = require('express');
const auth = require('../../authorization');
const bcrypt = require('bcrypt');

const db_users = require('../../db/users');
const db_auction = require('../../db/auction');

let router = express.Router();

// sub-tree requires login
router.use(auth.login);

// request to join the auction
// example:
// POST /join
router.post('/join', async (req, res) => {

    let id = req.auction_id;

    let success = await db_auction.join_auction_user({ user_id: req.session.uid, auction_id: id });
    if (success) {
        return res.send(`Request submitted`);
    } else {
        return res.status(400).send("Bad request");
    }
})

// leave the auction
// example:
// POST /join
router.delete('/leave', async (req, res) => { // todo cant leave after start

    let id = req.auction_id;

    let rows_deleted = await db_auction.leave_auction_user(req.session.uid, id);
    if (rows_deleted == 1) {
        return res.send(`Left auction`);
    } else if (rows_deleted == 0) {
        return res.status(400).send("Cant leave auction you are not part of");
    } else {
        return res.status(400).send("Bad request");
    }
})

module.exports = router;
