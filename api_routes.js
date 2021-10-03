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

api_router.post('/ping', async (req, res) => {
    res.send("pong");
})

module.exports = api_router;