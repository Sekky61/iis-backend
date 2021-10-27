const express = require('express');
const db = require('../../postgres_util').get_db();
const auth = require('../../authorization');
const bcrypt = require('bcrypt');

const common = require('../../common');
const db_users = require('../../db/users');

let router = express.Router();

router.use(auth.login);
router.use(auth.admin);

router.delete('/stats/sessions', async (req, res) => {
    // request contains session data
    db.query("TRUNCATE TABLE web_session").then((q_res) => { res.send("Sessions purged") });
})

router.get('/stats/sessions', async (req, res) => {
    // request contains session data
    db.query("SELECT * FROM web_session").then((q_res) => { res.send(q_res.rows) });
})

router.get('/users', async (req, res) => {
    // request contains session data
    let users = await db_users.get_all_users(1, 50);
    res.send(users);
})

router.post('/setusertype', async (req, res) => {
    let { username, user_type } = req.body;

    let result = await db_users.set_user_type(username, user_type);
    if (result) {
        res.send("Change executed");
    } else {
        res.status(400).send("Invalid request.");
    }
})

module.exports = router;
