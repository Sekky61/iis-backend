const express = require('express');
const db = require('../../postgres_util').get_db();
const auth = require('../../authorization');
const bcrypt = require('bcrypt');

const common = require('../../common');
const db_users = require('../../db/users');

let router = express.Router();

// sub-tree requires login and admin account type
router.use(auth.login);
router.use(auth.admin);

// delete sessions
// example:
// DELETE 
router.delete('/stats/sessions', async (req, res) => {
    // request contains session data
    db.query("TRUNCATE TABLE web_session").then((q_res) => { res.send("Sessions purged") });
})

// list sessions
// example:
// GET 
router.get('/stats/sessions', async (req, res) => {
    // request contains session data
    db.query("SELECT * FROM web_session").then((q_res) => { res.send(q_res.rows) });
})

// list sessions
// example:
// GET .../users?offset=0?number=2
router.get('/users', async (req, res) => {
    if (!req.query.offset || !req.query.number) {
        return res.status(400).send("Invalid request.");
    }
    let offset = parseInt(req.query.offset);
    let number = parseInt(req.query.number);
    if (isNaN(offset) || isNaN(number) || offset < 0 || number < 1 || number > 200) {
        return res.status(400).send("Invalid request.");
    }
    // request contains session data
    let users = await db_users.get_users(offset, number);
    res.send(users);
})

// set user type
// example:
// POST 
// {
//  "username": "user1",
//  "user_type": "licitator"
// }
router.post('/setusertype', async (req, res) => {
    let { username, user_type } = req.body; // todo username or id

    let result = await db_users.set_user_type(username, user_type);
    if (result) {
        res.send("Change executed");
    } else {
        res.status(400).send("Invalid request.");
    }
})

module.exports = router;
