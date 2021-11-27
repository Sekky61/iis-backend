const express = require('express');

const { ACCOUNT_TYPE, compare_passwords } = require('../common');
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
    const account_type = ACCOUNT_TYPE.USER;

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
        return res.status(400).send({ success: false, message: "Uživ. jméno je již zabráno" });
    }

    const user_valid = validation.new_user(user_obj);

    if (!user_valid) {
        console.log(`Register: ${username} failed - not valid`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }

    const success = await db_users.create_user(user_obj);

    if (success) {
        console.log(`Register: success ${username}`);
        return res.send({ success: true, message: `Založen účet ${username}` });
    } else {
        console.log(`Register: ${username} failed`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
})

// does username exist?
// example:
// GET?username=user1
router.get('/user-exists', async (req, res) => {

    const username = req.query.username;
    if (!username) {
        return res.status(401).send({ success: false, message: "Chybí parametr username" });
    }

    const username_in_use = await db_users.user_exists(username);

    return res.send({ success: true, message: "Uživ. data", data: username_in_use });
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
        return res.status(401).send({ success: false, message: "Špatný login" });
    }

    const pass_matches = await compare_passwords(password, user.heslo);

    if (!pass_matches) {
        console.log(`Login: ${username} failed`);
        return res.status(401).send({ success: false, message: "Špatný login" });
    }

    console.log(`Login: #${user.id} ${user.username}`);

    // set session
    req.session.uid = user.id;

    // what to send to client and remapping
    const user_data = (({ username, jmeno, prijmeni, email, typ }) => ({ username, first_name: jmeno, last_name: prijmeni, email, user_type: typ }))(user);
    return res.send({ success: true, message: "Přihlášen", data: { logged_in: true, user_data } });

})

// remove logged user from session cookie
// note: must be POST - browsers prefetch GET requests
// example:
// POST 
router.post('/logout', async (req, res) => {

    console.log(`Logout: #${req.session.uid}`);
    req.session.uid = undefined;
    return res.send({ success: true, message: "Odhlášen", data: { logged_in: false, user_data: null } });
})

// get session info (logged_in, user_data)
// example:
// GET
router.get('/get-session-info', async (req, res) => {

    console.log(`Get session info: ${req.session.uid}`);

    if (!req.session.uid) {
        // not logged in
        return res.send({ success: true, message: "Uživ. data", data: { logged_in: false, user_data: null } });
    }

    const user = await db_users.get_user_by_id(req.session.uid);

    if (!user) {
        return res.status(401).send({ success: false, message: "Chyba" });
    }

    const user_data = {
        username: user.username,
        first_name: user.jmeno,
        last_name: user.prijmeni,
        email: user.email,
        user_type: user.typ
    };

    return res.send({ success: true, message: "Uživ. data", data: { logged_in: true, user_data } });
})

// brief list of auctions
// lists only public auctions (confirmed by licit)
// example:
// GET .../auctions?offset=0?number=2
router.get('/auctions', async (req, res) => {

    const auctions = await db_auction.get_public_auctions();
    console.log(`List auctions`);
    res.send({ success: true, message: `Aukce`, data: auctions });
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