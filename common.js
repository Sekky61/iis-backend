
const bcrypt = require('bcrypt');

exports.ACCOUNT_TYPE = {
    USER: 'uzivatel',
    LIC: 'licitator',
    ADMIN: 'admin'
}

const saltRounds = 12;

// single place to change salt rounds
exports.hash_password = async (password) => {
    return await bcrypt.hash(password, saltRounds)
}

// single place to change salt rounds
exports.compare_passwords = async (password1, password2) => {
    return await bcrypt.compare(password1, password2);
}