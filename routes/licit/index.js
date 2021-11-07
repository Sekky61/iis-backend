const express = require('express');
const auth = require('../../authorization');
const bcrypt = require('bcrypt');

const common = require('../../common');
const db_users = require('../../db/users');
const db_auction = require('../../db/auction');

const router = express.Router();

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
        return res.status(400).send({ success: false, message: "Invalid request" });
    }
    const offset = parseInt(req.query.offset);
    const number = parseInt(req.query.number);
    if (isNaN(offset) || isNaN(number) || offset < 0 || number < 1 || number > 200) {
        return res.status(400).send({ success: false, message: "Invalid request" });
    }
    // request contains session data
    const auctions = await db_auction.list_auctions(offset, number);
    res.send({
        success: true, message: `Auctions ${offset}-${offset + number - 1}`, data: auctions
    });
})


module.exports = router; // todo defaults
