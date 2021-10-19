let db = require('../postgres_util').get_db();

exports.create_user = function (user_obj) {

    const q = `INSERT INTO Osoba(Jmeno, Prijmeni, StavKonta, DatumNarozeni, Bydliste, TelCislo, Email, Username, Heslo, Typ) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING *`;
    const values = [user_obj.first_name, user_obj.last_name,
        0, user_obj.birth_date, user_obj.address, user_obj.phone,
    user_obj.email, user_obj.username, user_obj.password, user_obj.account_type];

    return db.query(q, values);
}
