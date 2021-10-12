let express = require('express');
let db = require('./postgres_util').get_db();

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

    //todo validation

    const q = `INSERT INTO site_users(firstname, lastname, username, email, password) VALUES($1, $2, $3, $4, $5) RETURNING *`;
    const values = [first_name, last_name, username, email, password];

    console.log(`New registration ${username}`);

    db.query(q, values)
        .then(query_res => {
            res.send(`Success ${username}`);
        })
        .catch(e => {
            console.log(`DB ${e}`);
            res.status(500).send("Bad DB request");
        });
})

api_router.post('/login', async (req, res) => {

    let { username, password } = req.body;

    const q = `SELECT id, username, password FROM site_users WHERE username = $1`;
    const values = [username];

    db.query(q, values)
        .then(query_res => {
            if (query_res.rows.length > 0 && query_res.rows[0]["password"] == password) {
                console.log(`Login attempt succesfull ${username}`);
                res.send(`Logged in ${username}`);
            } else {
                console.log(`Login attempt unsuccesfull ${username}`);
                res.status(401).send("Bad login");
            }
        })
        .catch(e => {
            console.log(`DB ${e}`);
            res.status(500).send("Bad DB request");
        });
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