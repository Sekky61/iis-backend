let db = require('../postgres_util').get_db();
const bcrypt = require('bcrypt');

// trusts inputs
// generate hash and salt, store in db
exports.create_user = async function (user_obj) {

    let password = user_obj.password;
    let pass_hash;

    const saltRounds = 12;

    // const salt = bcrypt.genSaltSync(saltRounds);
    // const hash = bcrypt.hashSync(password, salt); // todo async

    const hash = await bcrypt.hash(password, saltRounds)

    console.log(hash);

    const q = `INSERT INTO uzivatel(Username, Heslo, Jmeno, Prijmeni, Email, Typ) VALUES($1, $2, $3, $4, $5, $6) RETURNING *`;
    const values = [user_obj.username, hash, user_obj.first_name, user_obj.last_name, user_obj.email, user_obj.account_type];

    return db.query(q, values);
}

exports.get_user_by_username = async function (username) {

    const q = `SELECT * FROM uzivatel WHERE Username = $1`;
    const values = [username];

    return db.query(q, values).then((query_res) => { return query_res.rows[0]; });
}

exports.get_user_by_id = async function (id) {

    const q = `SELECT * FROM uzivatel WHERE IDUzivatele = $1`;
    const values = [id];

    return db.query(q, values).then((query_res) => { return query_res.rows[0]; });
}

exports.user_exists = async function (username) {
    return exports.get_user(username).then((query_res) => query_res.rowCount > 0);
}
