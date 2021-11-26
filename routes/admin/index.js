
//api/admin

var appRoot = require('app-root-path');
const express = require('express');
const db = require(appRoot + '/postgres_util').get_db();
const auth = require(appRoot + '/authorization');
const validation = require(appRoot + '/validation');

const { hash_password } = require(appRoot + '/common');
const db_users = require(appRoot + '/db/users');

const router = express.Router();

// sub-tree requires login and admin account type
router.use(auth.login);
router.use(auth.admin);

// server status check
// example:
// GET
router.get('/server-status', async (req, res) => {
    console.log('Server status check');
    return res.send({ success: true, message: "OK" });
})

// DB status check
// example:
// GET
router.get('/db-status', async (req, res) => {
    console.log('DB status check');
    db.query('SELECT NOW()')
        .then((query_res) => {
            res.send({ success: true, message: "OK" });
        })
        .catch((err) => {
            console.log("DB test request failed");
            res.status(500).send({ success: false, message: "error" });
        })
})

// delete sessions
// example:
// DELETE 
router.delete('/stats/sessions', async (req, res) => {
    console.log(`Delete sessions`);
    // request contains session data
    return db.query("TRUNCATE TABLE web_session").then((q_res) => { res.send({ success: true, message: "Sezení vymazána" }) });
})

// list sessions
// example:
// GET 
router.get('/stats/sessions', async (req, res) => {
    console.log('List sessions');
    // request contains session data
    return db.query("SELECT * FROM web_session").then((q_res) => { res.send({ success: true, message: "Sezení", data: q_res.rows }) });
})

// list sessions
// example:
// GET .../users?offset=0?number=2
router.get('/users', async (req, res) => { // todo use validation.js

    const query_valid = validation.range_query(req.query);

    if (!query_valid) {
        console.log('List users: invalid');
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }

    const offset = parseInt(req.query.offset);
    const number = parseInt(req.query.number);
    // request contains session data
    const users = await db_users.get_users(offset, number);
    console.log(`List users: ${offset}-${offset + number - 1}`);
    return res.send({ success: true, message: `Uživatelé ${offset} - ${offset + number - 1}`, data: users });
})

// change user details (exact column names as in DB)
// example:
// POST 
// {
//  "id": 1,
//  "user_data": {
//      "Typ": "licitator"
//  }
// }
router.post('/change-user-data', async (req, res) => { // todo handle password change 
    const { id, user_data } = req.body; // todo username or id

    let properties = {
        username: user_data.username,
        jmeno: user_data.jmeno,
        prijmeni: user_data.prijmeni,
        email: user_data.email,
        typ: user_data.typ,
    }

    // delete undefined
    Object.keys(properties).forEach(key => properties[key] === undefined ? delete properties[key] : {});

    if (user_data.heslo) {
        // encrypt and set 
        const new_hash = await hash_password(user_data.heslo);
        const password_update_result = db_users.set_user_property(id, 'Heslo', new_hash);
        if (!password_update_result) {
            return res.status(400).send({ success: false, message: "Neplatný požadavek" });
        }
    }

    let result = true;

    for (key of Object.keys(properties)) {
        result &= await db_users.set_user_property(id, key, properties[key]); // todo can promise.all mess up?
    }

    if (result) {
        console.log(`Change user data of #${id}: success (${Object.keys(properties)})`); // todo password not printed here
        return res.send({ success: true, message: `Změna provedena. Pole: ${Object.keys(properties)}` });
    } else {
        console.log(`Change user data of #${id}: failure`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
})

// delete user
// example:
// DELETE 
// {
//  "id": 1,
// }
router.delete('/delete-user', async (req, res) => {
    console.log(req.body)
    const { id } = req.body; // todo username or id

    const result = await db_users.delete_user(id);

    if (result) {
        console.log(`Delete user #${id}: success`);
        return res.send({ success: true, message: `Uživatel #${id} smazán` });
    } else {
        console.log(`Delete user #${id}: failure`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
})

module.exports = router;
