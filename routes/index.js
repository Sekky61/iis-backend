const express = require('express');

const base_routes = require('./base');
const admin_routes = require('./admin');
const licit_routes = require('./licit');
const user_routes = require('./user');
const auction_routes = require('./auction');

let api_router = express.Router();

// cesty s různou úrovní povolení
// cesty musí být rozdělené, platí na ně jiný autorizační middleware
api_router.use('/admin', admin_routes);
api_router.use('/licit', licit_routes);
api_router.use('/user', user_routes);

// endpoints

api_router.use('/', base_routes);
api_router.use('/auction', auction_routes);

module.exports = api_router;