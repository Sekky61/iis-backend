const user = require('./user');
const licit = require('./licit');
const everybody = require('./everybody');

module.exports = { ...user, ...licit, ...everybody };
