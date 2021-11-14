

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
        console.log("keys")
        return false;
    }

    if (isNaN(obj.vyvolavaci_cena) || isNaN(obj.min_prihoz) || isNaN(obj.object)) {
        console.log("nums")
        return false;
    }

    if (obj.min_ucastniku && isNaN(obj.min_ucastniku)) {
        console.log("ucast")
        return false;
    }

    if (obj.pravidlo != 'uzavrena' && obj.pravidlo != 'otevrena') {
        console.log("prav")
        return false;
    }

    if (obj.typ != 'poptavkova' && obj.typ != 'nabidkova') {
        console.log("typ")
        return false;
    }

    return true;
}

exports.new_user = function (obj) {
    return true; // todo 
}
