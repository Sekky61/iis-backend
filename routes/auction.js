const express = require('express');

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
    req.auction_id = id;
    next();
});

auction_router.use('/:id', specific_auction_router);

module.exports = auction_router;