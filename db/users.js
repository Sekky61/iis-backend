const db = require('../postgres_util').get_db();
const bcrypt = require('bcrypt');
const common = require('../common');

// trusts inputs
// generate hash and salt, store in db
exports.create_user = async function (user_obj) {

    let password = user_obj.password;

    const saltRounds = 12;
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

exports.get_all_users = async function (offset, number) {

    const q = `SELECT * FROM uzivatel LIMIT $1 OFFSET $2`;
    const values = [number, offset];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}

exports.set_user_type = async function (username, user_type) {

    const q = `UPDATE uzivatel SET Typ = $1 WHERE Username = $2;`;
    const values = [user_type, username];

    if (Object.values(common.ACCOUNT_TYPE).includes(user_type)) {
        return db.query(q, values).then((query_res) => { return query_res.rowCount == 1; });
    } else {
        return false;
    }

}
