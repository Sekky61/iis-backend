const user = require('./user');
const licit = require('./licit');
const everybody = require('./everybody');

// db/auction is a module for DB queries regarding auctions
// It is split into 3 files - queries meant for everybody/users/licitators  
module.exports = { ...user, ...licit, ...everybody };
