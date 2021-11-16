var appRoot = require('app-root-path');
const db = require(appRoot + '/postgres_util').get_db();
const bcrypt = require('bcrypt');
const common = require(appRoot + '/common');

// trusts inputs
// generate hash and salt, store in db
exports.create_user = async function (user_obj) {

    let password = user_obj.password;

    const saltRounds = 12;
    const hash = await bcrypt.hash(password, saltRounds)

    const q = `INSERT INTO uzivatel(Username, Heslo, Jmeno, Prijmeni, Email, Typ) VALUES($1, $2, $3, $4, $5, $6) RETURNING *`;
    const values = [user_obj.username, hash, user_obj.first_name, user_obj.last_name, user_obj.email, user_obj.account_type];

    return db.query(q, values).then((query_res) => { return query_res.rowCount; });
}

exports.get_user_by_username = async function (username) {

    const q = `SELECT * FROM uzivatel WHERE Username = $1`;
    const values = [username];

    return db.query(q, values).then((query_res) => { return query_res.rows[0]; });
}

exports.get_user_by_id = async function (id) {

    const q = `SELECT * FROM uzivatel WHERE id = $1`;
    const values = [id];

    return db.query(q, values).then((query_res) => { if (query_res.rowCount > 0) { return query_res.rows[0]; } else { return null; } });
}

exports.user_exists = async function (username) {
    return exports.get_user_by_username(username).then((query_res) => { query_res !== null });
}

exports.get_users = async function (offset, number) {

    const q = `SELECT * FROM uzivatel LIMIT $1 OFFSET $2`;
    const values = [number, offset];

    return db.query(q, values).then((query_res) => { return query_res.rows; });
}

// todo use general set_user_property
exports.set_user_type = async function (username, user_type) {

    const q = `UPDATE uzivatel SET Typ = $1 WHERE Username = $2;`;
    const values = [user_type, username];

    if (Object.values(common.ACCOUNT_TYPE).includes(user_type)) {
        return db.query(q, values).then((query_res) => { return query_res.rowCount == 1; });
    } else {
        return false;
    }
}

exports.set_user_property = async function (uid, property, value) {

    const q = `UPDATE uzivatel SET ${property} = $1 WHERE id = $2;`;
    const values = [value, uid];

    return db.query(q, values).then((query_res) => { return query_res.rowCount == 1; });
}

exports.delete_user = async function (uid) { // todo not tested, cascade?

    const q = `DELETE FROM uzivatel WHERE id = $1`;
    const values = [uid];

    return db.query(q, values).then((query_res) => { return query_res.rowCount == 1; });
}
