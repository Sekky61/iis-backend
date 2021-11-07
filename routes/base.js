const express = require('express');
const db = require('../postgres_util').get_db();
const bcrypt = require('bcrypt');

const common = require('../common');
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

    //todo more validation

    const username_in_use = await db_users.user_exists(username);

    const name_valid = first_name != "" && last_name != "";
    const email_valid = email.includes("@"); // todo validate by sending email
    const password_valid = password.length >= 6 && /\d/.test(password) && /[A-Za-z]/.test(password);

    if (username_in_use || !name_valid || !email_valid || !password_valid) {
        console.log(`register: invalid request.\nusername taken: ${username_in_use} | name valid: ${name_valid} | email valid: ${email_valid} | password valid: ${password_valid}`);
        return res.status(400).send({ success: false, message: "Invalid request" });
    }

    try {
        await db_users.create_user(user_obj);
        console.log(`New registration ${username}`);
        res.send({ success: true, message: `Success ${username}` });
    } catch (e) {
        console.log(`DB ${e}`);
        res.status(500).send({ success: false, message: "Bad DB request" });
    }
})

// assigns user to a session
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
        console.log(`Login attempt unsuccesfull ${username}`);
        return res.status(401).send({ success: false, message: "Bad login" });
    }

    console.log(user);

    const pass_matches = await bcrypt.compare(password, user.heslo);

    if (pass_matches) {
        console.log(`Login attempt succesfull ${username}`);
        user.logged_in = true;
        req.session.uid = user.iduzivatele;
        // what to send to client
        // and remapping
        const user_data = (({ username, jmeno, prijmeni, email, typ }) => ({ username, first_name: jmeno, last_name: prijmeni, email, typ }))(user);
        return res.send({ success: true, message: "Logged in", data: { logged_in: true, user_data } });
    } else {
        console.log(`Login attempt unsuccesfull ${username}`);
        return res.status(401).send({ success: false, message: "Bad login" });
    }
})

// remove logged user from session cookie
// note: must be POST - browsers prefetch GET requests
// example:
// POST 
router.post('/logout', async (req, res) => {

    req.session.uid = undefined;
    console.log(`Logout (uid wiped from session)`);
    return res.send({ success: true, message: "Logged out", data: { logged_in: false, user_data: null } });
})

// get session info (logged_in, user_data)
// example:
// GET
router.get('/get-session-info', async (req, res) => {

    if (!req.session.uid) {
        res.send({ success: true, message: "Not logged in" });
    }

    const user = await db_users.get_user_by_id(req.session.uid);

    if (!user) {
        return res.status(401).send({ success: false, message: "Error" });
    }

    res.send({
        success: true, message: "User data", data: {
            username: user.username,
            first_name: user.jmeno,
            last_name: user.prijmeni,
            email: user.email,
            user_type: user.typ
        }
    });
})

// brief list of auctions
// example:
// GET .../auctions?offset=0?number=2
router.get('/auctions', async (req, res) => {
    if (!req.query.offset || !req.query.number) {
        return res.status(400).send({ success: false, message: "Invalid request" });
    }
    const offset = parseInt(req.query.offset);
    const number = parseInt(req.query.number);
    if (isNaN(offset) || isNaN(number) || offset < 0 || number < 1 || number > 200) {
        return res.status(400).send({ success: false, message: "Invalid request" });
    }
    // request contains session data
    const auctions = await db_auction.get_brief_auctions(offset, number);
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