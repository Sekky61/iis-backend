const express = require('express');
const db = require('../postgres_util').get_db();
const bcrypt = require('bcrypt');

const common = require('../common');
const db_users = require('../db/users');
const db_auction = require('../db/auction');

let router = express.Router();

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

    let { first_name, last_name, username, email, password } = req.body;
    let account_type = common.ACCOUNT_TYPE.USER;

    let user_obj = {
        first_name,
        last_name,
        username,
        email,
        password,
        account_type
    }

    //todo more validation

    let username_in_use = await db_users.user_exists(username);

    let name_valid = first_name != "" && last_name != "";
    let email_valid = email.includes("@"); // todo validate by sending email
    let password_valid = password.length >= 6 && /\d/.test(password) && /[A-Za-z]/.test(password);

    if (username_in_use || !name_valid || !email_valid || !password_valid) {
        console.log(`register: invalid request.\nusername taken: ${username_in_use} | name valid: ${name_valid} | email valid: ${email_valid} | password valid: ${password_valid}`);
        res.status(400).send("Invalid request");
        return;
    }

    try {
        await db_users.create_user(user_obj);
        console.log(`New registration ${username}`);
        res.send(`Success ${username}`);
    } catch (e) {
        console.log(`DB ${e}`);
        res.status(500).send("Bad DB request");
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

    let { username, password } = req.body;

    let user = await db_users.get_user_by_username(username);

    if (!user) {
        console.log(`Login attempt unsuccesfull ${username}`);
        return res.status(401).send("Bad login");
    }

    console.log(user);

    let pass_matches = await bcrypt.compare(password, user.heslo);

    if (pass_matches) {
        console.log(`Login attempt succesfull ${username}`);
        user.logged_in = true;
        req.session.uid = user.iduzivatele;
        // what to send to client
        // and remapping
        const user_data = (({ username, jmeno, prijmeni, email }) => ({ username, first_name: jmeno, last_name: prijmeni, email }))(user);
        res.send({ logged_in: true, user_data });
    } else {
        console.log(`Login attempt unsuccesfull ${username}`);
        res.status(401).send("Bad login");
    }
})

// remove logged user from session cookie
// note: must be POST - browsers prefetch GET requests
// example:
// POST 
router.post('/logout', async (req, res) => {

    req.session.uid = undefined;
    console.log(`Logout`);
    return res.send("Logged out");
})

// get session info (logged_in, user_data)
// example:
// GET
router.get('/get-session-info', async (req, res) => {

    if (!req.session.uid) {
        res.send({ logged_in: false });
    }

    let user = await db_users.get_user_by_id(req.session.uid);

    if (!user) {
        return res.status(401).send("User does not exist");
    }

    res.send({
        username: user.username,
        first_name: user.jmeno,
        last_name: user.prijmeni,
        email: user.email,
        user_type: user.typ
    });
})

// brief list of auctions
// example:
// GET .../auctions?offset=0?number=2
router.get('/auctions', async (req, res) => {
    if (!req.query.offset || !req.query.number) {
        return res.status(400).send("Invalid request.");
    }
    let offset = parseInt(req.query.offset);
    let number = parseInt(req.query.number);
    if (isNaN(offset) || isNaN(number) || offset < 0 || number < 1 || number > 200) {
        return res.status(400).send("Invalid request.");
    }
    // request contains session data
    let auctions = await db_auction.get_brief_auctions(offset, number);
    res.send(auctions);
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

// DB status check
// example:
// GET
router.get('/db-status', async (req, res) => { // todo admin only
    db.query('SELECT NOW()')
        .then((query_res) => {
            res.send(`Database OK: ${JSON.stringify(query_res.rows[0]["now"])}`);
        })
        .catch((err) => {
            console.log("DB test request failed");
            res.status(500).send("DB error");
        })
})

module.exports = router;