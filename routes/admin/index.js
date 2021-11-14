var appRoot = require('app-root-path');
const express = require('express');
const db = require(appRoot + '/postgres_util').get_db();
const auth = require(appRoot + '/authorization');
const validation = require(appRoot + '/validation');
const bcrypt = require('bcrypt');

const common = require(appRoot + '/common');
const db_users = require(appRoot + '/db/users');

const router = express.Router();

// sub-tree requires login and admin account type
router.use(auth.login);
router.use(auth.admin);

// DB status check
// example:
// GET
router.get('/db-status', async (req, res) => {
    console.log('Admin: DB status check');
    db.query('SELECT NOW()')
        .then((query_res) => {
            res.send(`Database OK: ${JSON.stringify(query_res.rows[0]["now"])}`);
        })
        .catch((err) => {
            console.log("DB test request failed");
            res.status(500).send("DB error");
        })
})

// delete sessions
// example:
// DELETE 
router.delete('/stats/sessions', async (req, res) => {
    console.log(`Admin: delete sessions`);
    // request contains session data
    return db.query("TRUNCATE TABLE web_session").then((q_res) => { res.send({ success: true, message: "Sessions purged" }) });
})

// list sessions
// example:
// GET 
router.get('/stats/sessions', async (req, res) => {
    console.log('Admin: list sessions');
    // request contains session data
    return db.query("SELECT * FROM web_session").then((q_res) => { res.send({ success: true, message: "Sessions", data: q_res.rows }) });
})

// list sessions
// example:
// GET .../users?offset=0?number=2
router.get('/users', async (req, res) => { // todo use validation.js

    const query_valid = validation.range_query(req.query);

    if (!query_valid) {
        console.log('Admin: list users: invalid');
        return res.status(400).send({ success: false, message: "Invalid request" });
    }

    const offset = parseInt(req.query.offset);
    const number = parseInt(req.query.number);
    // request contains session data
    const users = await db_users.get_users(offset, number);
    console.log(`Admin: list users: ${offset}-${offset + number - 1}`);
    return res.send({ success: true, message: `Users ${offset} - ${offset + number - 1}`, data: users });
})

// change user details
// example:
// POST 
// {
//  "id": 1,
//  "user_data": {
//      "user_type": "licitator"
//  }
// }
router.post('/change-user-data', async (req, res) => {
    const { id, user_data } = req.body; // todo username or id

    for (key of user_data) { // todo test

        let result = await db_users.set_user_property(id, key, user_data[key]); // todo can promise.all mess up?
    }

    if (result) {
        console.log(`Admin: change user data of ${id}: success`);
        return res.send({ success: true, message: "Change executed" });
    } else {
        console.log(`Admin: change user data of ${id}: failure`);
        return res.status(400).send({ success: false, message: "Invalid request" });
    }
})

module.exports = router;
