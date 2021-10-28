const express = require('express');
const db = require('../../postgres_util').get_db();
const auth = require('../../authorization');
const bcrypt = require('bcrypt');

const common = require('../../common');
const db_users = require('../../db/users');

let router = express.Router();

router.use(auth.login);
router.use(auth.licit);

// demo
router.get('/demo', async (req, res) => {
    return res.send(`Yes I can see you are licitator mr. ${req.user.username}`);
})

module.exports = router;
