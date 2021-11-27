const express = require('express');
var appRoot = require('app-root-path');
const db_auction = require(appRoot + '/db/auction');

const user_auction_routes = require('./user/auction');
const licit_auction_routes = require('./licit/auction');
const public_auction_routes = require('./auction_public');

const auction_router = express.Router();
const specific_auction_router = express.Router();

specific_auction_router.use('/user', user_auction_routes);
specific_auction_router.use('/licit', licit_auction_routes);
specific_auction_router.use('', public_auction_routes);

auction_router.use('/:id', async (req, res, next) => {
    const { id } = req.params;
    const id_parsed = parseInt(id);
    if (isNaN(id_parsed)) {
        console.log(`Invalid auction id #${id}`);
        return res.status(400).send({ success: false, message: "Neplatné číslo aukce" });
    }
    req.auction_id = id_parsed;
    const auction = await db_auction.get_auction(id_parsed);
    if (auction) {
        req.auction = auction;
        next();
    } else {
        return res.status(400).send({ success: false, message: "Aukce neexistuje" });
    }
});

auction_router.use('/:id', specific_auction_router);

module.exports = auction_router;