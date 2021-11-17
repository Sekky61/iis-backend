

const AUCTION_ADD_KEYS = ['autor', 'nazev', 'vyvolavaci_cena', 'min_prihoz', 'object', 'pravidlo', 'typ', 'min_ucastniku', 'stav'];

function obj_has_keys(obj, keys) {
    const obj_has_key = (key) => obj.hasOwnProperty(key) && obj[key] !== undefined;
    return keys.every(obj_has_key);
}

// returns true if auction_obj is valid and can be saved in DB
exports.new_auction = function (obj) {
    console.log("----")
    console.dir(obj);

    // has all properties
    if (!obj_has_keys(obj, AUCTION_ADD_KEYS)) {
        console.log(`New auction validation fail: Missing keys`);
        return false;
    }

    if (isNaN(obj.vyvolavaci_cena) || isNaN(obj.min_prihoz) || isNaN(obj.object)) {
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
