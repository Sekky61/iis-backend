let express = require('express');
let db = require('./postgres_util').get_db();
const bcrypt = require('bcrypt');

let common = require('./common');
let db_users = require('./db/users');

let api_router = express.Router();

api_router.get('/db-status', async (req, res) => {
    db.query('SELECT NOW()')
        .then((query_res) => {
            res.send(`Database OK: ${JSON.stringify(query_res.rows[0]["now"])}`);
        })
        .catch((err) => {
            console.log("DB test request failed");
            res.status(500).send("DB error");
        })
})

api_router.post('/register', async (req, res) => {

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
        console.log("register: invalid request");
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

api_router.post('/login', async (req, res) => {

    let { username, password } = req.body;

    let user = await db_users.get_user_by_username(username);

    let pass_matches = await bcrypt.compare(password, user.heslo);

    if (pass_matches) {
        console.log(`Login attempt succesfull ${username}`);
        console.dir(user);
        req.session.uid = user.iduzivatele;
        console.dir(req.session);
        res.send(`Logged in ${username}`);
    } else {
        console.log(`Login attempt unsuccesfull ${username}`);
        res.status(401).send("Bad login");
    }
})

// resource for logged users
api_router.get('/logged-in-demo', async (req, res) => {
    // request contains session data
    if (req.session.uid) {
        let user = await db_users.get_user_by_id(req.session.uid);
        res.end(`I see you are loggid in, ${user.username}`);
    } else {
        res.end('Only for logged in users!');
    }
})

// Cookies session demo
api_router.get('/session-demo', function (req, res) {
    // request contains session data
    if (req.session.views) {
        req.session.views++
        res.setHeader('Content-Type', 'text/html')
        res.write('<p>views: ' + req.session.views + '</p>')
        res.write('<p>expires in: ' + (req.session.cookie.maxAge / 1000) + 's</p>')
        res.end()
    } else {
        // new session
        req.session.views = 1
        res.end('welcome to the session demo. refresh!')
    }
})

module.exports = api_router;