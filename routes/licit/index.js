const express = require('express');
const auth = require('../../authorization');
const bcrypt = require('bcrypt');

const common = require('../../common');
const db_users = require('../../db/users');
const db_auction = require('../../db/auction');

let router = express.Router();

router.use(auth.login);
router.use(auth.licit);

// demo
router.get('/demo', async (req, res) => {
    return res.send(`Yes I can see you are licitator mr. ${req.user.username}`);
})

// detailed list of auctions
// example:
// GET .../auctions?offset=0?number=2
router.get('/auctions', async (req, res) => {
    if (!req.query.offset || !req.query.number) {
        return res.status(400).send("Invalid request.");
    }
    let offset = parseInt(req.query.offset);
    let number = parseInt(req.query.number);
    if (isNaN(offset) || isNaN(number) || offset < 0 || number < 1 || number > 200) {
        return res.status(400).send("Invalid request.");
    }
    // request contains session data
    let auctions = await db_auction.get_auctions(offset, number);
    res.send(auctions);
})

// sign up to auction as licitator
// example:
// POST 
router.post('/join-auction/:id', async (req, res) => {
    let { id } = req.params;

    // request contains session data
    let rows_affected = await db_auction.join_auction_licit(req.session.uid, id);
    if (rows_affected != 1) {
        return res.status(400).send("Invalid request.");
    }
    res.send("Added as licitator");
})

module.exports = router;
