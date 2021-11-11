var appRoot = require('app-root-path');
const express = require('express');
const auth = require(appRoot + '/authorization');
const bcrypt = require('bcrypt');

const db_users = require(appRoot + '/db/users');
const db_auction = require(appRoot + '/db/auction');

const router = express.Router();

// sub-tree requires login
router.use(auth.login);

// request to join the auction
// example:
// POST /join
router.post('/join', async (req, res) => {

    const id = req.auction_id;

    const success = await db_auction.join_auction_user({ user_id: req.session.uid, auction_id: id });
    if (success) {
        return res.send({ success: true, message: "Request submitted" });
    } else {
        return res.status(400).send({ success: false, message: "Invalid request" });
    }
})

// leave the auction
// example:
// POST /join
router.delete('/leave', async (req, res) => { // todo cant leave after start

    const id = req.auction_id;

    const rows_deleted = await db_auction.leave_auction_user(req.session.uid, id);
    if (rows_deleted == 1) {
        return res.send({ success: true, message: "Left auction" });
    } else if (rows_deleted == 0) {
        return res.status(400).send({ success: false, message: "Invalid request (you are not participating in the auction)" });
    } else {
        return res.status(400).send({ success: false, message: "Invalid request" });
    }
})

module.exports = router;
