let db = require('../postgres_util').get_db();
const bcrypt = require('bcrypt');

// trusts inputs
// generate hash and salt, store in db
exports.create_user = function (user_obj) {

    let password = user_obj.password;
    let pass_hash;

    const saltRounds = 12;

    const salt = bcrypt.genSaltSync(saltRounds);
    const hash = bcrypt.hashSync(password, salt); // todo async

    console.log(hash);

    const q = `INSERT INTO uzivatel(Username, Heslo, Jmeno, Prijmeni, Email, Typ) VALUES($1, $2, $3, $4, $5, $6) RETURNING *`;
    const values = [user_obj.username, hash, user_obj.first_name, user_obj.last_name, user_obj.email, user_obj.account_type];

    return db.query(q, values);
}

exports.user_exists = function (username) {

    const q = `SELECT * FROM uzivatel WHERE Username = $1`;
    const values = [username];

    return db.query(q, values)
        .then(query_res => {
            return query_res.rowCount > 0;
        })
        .catch(e => {
            return null;
        });
}
