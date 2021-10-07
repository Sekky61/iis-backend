let express = require('express');
let db = require('./postgres_util').get_db();

let api_router = express.Router();

api_router.get('/', async (req, res) => {
    const query_res = await db.query('SELECT NOW()')
    //JSON.stringify(query_res);
    //console.dir(query_res);
    res.send(`Now be: <pre style="max-width: 50%"> ${JSON.stringify(query_res)} </pre>`);
})

api_router.post('/', async (req, res) => {
    let rand_id = Math.floor((1 + Math.random()) * 0x10000);

    const text = 'INSERT INTO users(id, name) VALUES($1, $2) RETURNING *'
    const values = [rand_id, 'Jerry']

    try {
        const query_res = await db.query(text, values)
        console.log(`New user: ${query_res.rows[0]}`);
        res.send(`New user: ${JSON.stringify(query_res.rows[0])} `);
    } catch (err) {
        console.log(err.stack)
    }
})

api_router.post('/register', async (req, res) => {

    let { first_name, last_name, username, email, password } = req.body;

    //todo validation

    const q = `INSERT INTO site_users(firstname, lastname, username, email, password) VALUES($1, $2, $3, $4, $5) RETURNING *`;
    const values = [first_name, last_name, username, email, password];

    db.query(q, values)
        .then(resp => {
            console.log(resp.fields.map(field => field.name)) // ['first_name', 'last_name']
            console.log(resp.rows[0]) // ['Jamie', 'Carlson']

            res.send(`Success ${username}`);
            return;
        })
        .catch(e => {
            console.log("Caught err");
            console.dir(e);
            res.status(500).send("Bad DB request");
        });
})

api_router.post('/ping', async (req, res) => {
    res.send("pong");
})

// Cookies session demo
api_router.get('/session-demo', function (req, res, next) {
    if (req.session.views) {
        req.session.views++
        res.setHeader('Content-Type', 'text/html')
        res.write('<p>views: ' + req.session.views + '</p>')
        res.write('<p>expires in: ' + (req.session.cookie.maxAge / 1000) + 's</p>')
        res.end()
    } else {
        req.session.views = 1
        res.end('welcome to the session demo. refresh!')
    }
})

module.exports = api_router;