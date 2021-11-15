const express = require('express');
const db = require('../postgres_util').get_db();
const bcrypt = require('bcrypt');

const common = require('../common');
const validation = require('../validation');
const db_users = require('../db/users');
const db_auction = require('../db/auction');

const router = express.Router();

// create user of type 'uzivatel'
// example:
// POST 
// {
//   "first_name": "Ada",
//   "last_name": "Toren",
//   "username": "user1",
//   "password": "12345a",
//   "email": "email@email.com"
// }
router.post('/register', async (req, res) => {

    const { first_name, last_name, username, email, password } = req.body;
    const account_type = common.ACCOUNT_TYPE.USER;

    const user_obj = {
        first_name,
        last_name,
        username,
        email,
        password,
        account_type
    }


    const username_in_use = await db_users.user_exists(username);

    if (username_in_use) {
        console.log(`Register: ${username} failed - already in use`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek - username already in use" });
    }

    //todo more validation
    const user_valid = validation.new_user(user_obj);

    if (!user_valid) {
        console.log(`Register: ${username} failed - not valid`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }

    const rows_affected = await db_users.create_user(user_obj);

    if (rows_affected == 1) {
        console.log(`Register: success ${username}`);
        return res.send({ success: true, message: `Success ${username}` });
    } else {
        console.log(`Register: ${username} failed`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" }); // todo 500?
    }
})

// assigns user to a session, returns user data
// example:
// POST 
// {
//   "username": "AdaK7",
//   "password": "1234567a"
// }
router.post('/login', async (req, res) => {

    const { username, password } = req.body;

    const user = await db_users.get_user_by_username(username);

    if (!user) {
        console.log(`Login: ${username} does not exist`);
        return res.status(401).send({ success: false, message: "Bad login" }); // todo 400?
    }

    const pass_matches = await bcrypt.compare(password, user.heslo);

    if (!pass_matches) {
        console.log(`Login: ${username} failed`);
        return res.status(401).send({ success: false, message: "Bad login" });
    }

    console.log(`Login attempt succesfull ${username}`);

    // set session
    req.session.uid = user.iduzivatele;

    // what to send to client and remapping
    const user_data = (({ username, jmeno, prijmeni, email, typ }) => ({ username, first_name: jmeno, last_name: prijmeni, email, user_type: typ }))(user);
    return res.send({ success: true, message: "Logged in", data: { logged_in: true, user_data } });

})

// remove logged user from session cookie
// note: must be POST - browsers prefetch GET requests
// example:
// POST 
router.post('/logout', async (req, res) => {

    console.log(`Logout: ${req.session.uid}`);
    req.session.uid = undefined;
    return res.send({ success: true, message: "Logged out", data: { logged_in: false, user_data: null } });
})

// get session info (logged_in, user_data)
// example:
// GET
router.get('/get-session-info', async (req, res) => {

    console.log(`Get session info: ${req.session.uid}`);

    if (!req.session.uid) {
        // not logged in
        return res.send({ success: true, message: "User data", data: { logged_in: false, user_data: null } });
    }

    const user = await db_users.get_user_by_id(req.session.uid);

    if (!user) {
        return res.status(401).send({ success: false, message: "Error" });
    }

    const user_data = {
        username: user.username,
        first_name: user.jmeno,
        last_name: user.prijmeni,
        email: user.email,
        user_type: user.typ
    };

    return res.send({ success: true, message: "User data", data: { logged_in: true, user_data } });
})

// brief list of auctions
// lists only public auctions (confirmed by licit)
// example:
// GET .../auctions?offset=0?number=2
router.get('/auctions', async (req, res) => {

    // query params
    const query_valid = validation.range_query(req.query);

    if (!query_valid) {
        console.log(`List auctions: invalid query`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }

    const offset = parseInt(req.query.offset);
    const number = parseInt(req.query.number);

    const auctions = await db_auction.get_live_auctions(offset, number);
    console.log(`List auctions: ${offset}-${offset + number - 1}`);
    res.send({ success: true, message: `Auctions ${offset}-${offset + number - 1}`, data: auctions });
})

// Cookies session demo
// example:
// GET
router.get('/session-demo', function (req, res) {
    // request contains session data
    if (req.session.views) {
        req.session.views++;
        res.send(`Page hits: ${req.session.views} expiration: ${req.session.cookie.maxAge / 1000} s`);
    } else {
        // new session
        req.session.views = 1;
        res.send('welcome to the session demo. refresh!');
    }
})

module.exports = router;