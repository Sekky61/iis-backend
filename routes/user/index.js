const express = require('express');
const db = require('../../postgres_util').get_db();
const auth = require('../../authorization');
const bcrypt = require('bcrypt');

const common = require('../../common');
const db_users = require('../../db/users');

let router = express.Router();

router.use(auth.login);

// resource for logged users
router.get('/logged-in-demo', async (req, res) => {
    return res.send(`Yes I can see you are logged in mr. ${req.user.username}`);
})

module.exports = router;
