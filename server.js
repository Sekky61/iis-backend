const express = require('express');
const app = express();

const cors = require("cors")
app.use(cors());


const { port, pg_conn_string } = require('./config');

const { Client } = require('pg');

console.log(`Connectionstring: ${pg_conn_string}`);

const client = new Client({
    connectionString: pg_conn_string
})
client.connect()

app.get('/', async (req, res) => {
    const query_res = await client.query('SELECT NOW()')
    //JSON.stringify(query_res);
    console.dir(query_res);
    res.send(`Now be: <pre style="max-width: 50%"> ${JSON.stringify(query_res)} </pre>`);
})

app.post('/', async (req, res) => {
    let rand_id = Math.floor((1 + Math.random()) * 0x10000);

    const text = 'INSERT INTO users(id, name) VALUES($1, $2) RETURNING *'
    const values = [rand_id, 'Jerry']

    try {
        const query_res = await client.query(text, values)
        console.log(query_res.rows[0]);
        res.send(`New user: ${JSON.stringify(query_res.rows[0])} `);
    } catch (err) {
        console.log(err.stack)
    }
})

app.listen(port, () => console.log('xPress listening on port ' + port));
