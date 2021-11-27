

const AUCTION_ADD_KEYS = ['autor', 'nazev', 'vyvolavaci_cena', 'min_prihoz', 'pravidlo', 'typ', 'min_ucastniku', 'stav', 'adresa', 'popis'];
const OBJECT_ADD_KEYS = ["nazev", "adresa", "popis", "foto_url"];

function obj_has_keys(obj, keys) {
    const obj_has_key = (key) => obj.hasOwnProperty(key) && obj[key] !== undefined;
    return keys.every(obj_has_key);
}

function length_between(str, a, b) {
    return str.length >= a && str.length <= b;
}

function is_alphanum(str) {
    return /\d/.test(str) && /[a-zA-Z]/g.test(str);
}

// returns true if auction_obj is valid and can be saved in DB
exports.new_auction = function (obj) {

    // has all properties
    if (!obj_has_keys(obj, AUCTION_ADD_KEYS)) {
        console.log(`New auction validation fail: Missing keys`);
        return false;
    }

    if (isNaN(obj.vyvolavaci_cena) || isNaN(obj.min_prihoz)) {
        console.log(`New auction validation fail: NaN`);
        return false;
    }

    if (obj.min_ucastniku && isNaN(obj.min_ucastniku)) {
        console.log(`New auction validation fail: min. ucastniku`);
        return false;
    }

    if (obj.pravidlo != 'uzavrena' && obj.pravidlo != 'otevrena') {
        console.log(`New auction validation fail: pravidlo aukce`);
        return false;
    }

    if (obj.typ != 'poptavkova' && obj.typ != 'nabidkova') {
        console.log(`New auction validation fail: typ aukce`);
        return false;
    }

    return true;
}

// returns true if auction_obj is valid and can be saved in DB
exports.new_object = function (obj) {
    console.log("----")
    console.dir(obj);

    ["nazev", "adresa", "popis", "foto_url"]

    // add object
    //   const object_obj = {
    //     nazev: objekt.nazev,
    //     adresa: objekt.adresa,
    //     popis: objekt.popis,
    //     foto_url: objekt.foto_url
    // };

    // has all properties
    if (!obj_has_keys(obj, OBJECT_ADD_KEYS)) {
        console.log(`New object validation fail: Missing keys`);
        return false;
    }

    if (obj.nazev.length <= 0 || obj.nazev.length > 64) {
        console.log(`New object validation fail: nazev`);
        return false;
    }

    if (obj.adresa.length <= 0 || obj.adresa.length > 100) {
        console.log(`New object validation fail: adresa`);
        return false;
    }

    if (obj.popis.length <= 0 || obj.popis.length > 500) {
        console.log(`New object validation fail: popis`);
        return false;
    }

    if (obj.foto_url != null) {
        if (obj.foto_url.length <= 0 || obj.foto_url.length > 128) {
            console.log(`New object validation fail: foto_url`);
            return false;
        }
    }

    return true;
}

exports.new_user = function (obj) {

    if (obj.first_name == "" || obj.last_name == "") {
        console.log(`New user validation failed: full name`);
        return false;
    }

    if (!obj.email.includes("@")) {
        console.log(`New user validation failed: email`);
        return false;
    }

    if (obj.password.length < 6
        || ! /\d/.test(obj.password)
        || ! /[A-Za-z]/.test(obj.password)) {
        console.log(`New user validation failed: password`);
        return false;
    }

    return true;
}

exports.change_user_data = function (obj) {

    if (obj.jmeno && (obj.jmeno == "" || !length_between(obj.jmeno, 1, 31))) {
        console.log(`Change user data validation failed: first name`);
        return false;
    }

    if (obj.prijmeni && (obj.prijmeni == "" || !length_between(obj.prijmeni, 1, 31))) {
        console.log(`Change user data validation failed: last name`);
        return false;
    }

    if (obj.username && (obj.username == "" || !length_between(obj.username, 1, 31))) {
        console.log(`Change user data validation failed: last name`);
        return false;
    }

    if (obj.email && (! /^(.+)@(.+)$/.test(obj.email) || !length_between(obj.email, 1, 63))) {
        console.log(`Change user data validation failed: email name`);
        return false;
    }

    if (obj.heslo && (!is_alphanum(obj.heslo) || !length_between(obj.password, 6, 63))) {
        console.log(`Change user data validation failed: password`);
        return false;
    }

    return true;
}

// validates offset + number queries
exports.range_query = function (obj) {

    if (!obj.offset || !obj.number) {
        return false;
    }

    const offset = parseInt(obj.offset);
    const number = parseInt(obj.number);
    if (isNaN(offset) || isNaN(number) || offset < 0 || number < 1 || number > 200) {
        return false;
    }

    return true;
}
