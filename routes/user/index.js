const express = require('express');
const auth = require('../../authorization');
const bcrypt = require('bcrypt');

const db_users = require('../../db/users');

let router = express.Router();

router.use(auth.login);

// resource for logged users
router.get('/logged-in-demo', async (req, res) => {
    return res.send(`Yes I can see you are logged in mr. ${req.user.username}`);
})

router.post('/set-password', async (req, res) => {

    let { new_password } = req.body;

    const saltRounds = 12;
    const hash = await bcrypt.hash(new_password, saltRounds);

    console.log(hash);

    db_users.set_user_property(req.session.uid, 'Heslo', hash);

    return res.send(`Password changed`);
})

module.exports = router;
