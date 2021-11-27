var appRoot = require('app-root-path');
const express = require('express');
const auth = require(appRoot + '/authorization');
const { hash_password, compare_passwords } = require(appRoot + '/common');

const validation = require(appRoot + '/validation');

const db_users = require(appRoot + '/db/users');
const db_auction = require(appRoot + '/db/auction');

const router = express.Router();

// sub-tree requires login
router.use(auth.login);

// set password (currently not used)
// example:
// POST 
// { 
//     "old_password": "12345a", 
//     "new_password": "1234567a", 
// }
router.post('/set-password', async (req, res) => {

    const { old_password, new_password } = req.body;

    const old_pass_matches = await compare_passwords(old_password, req.user.heslo);

    if (old_pass_matches) {
        // old passwords match, set new one
        const new_hash = await hash_password(new_password);
        db_users.set_user_property(req.user.id, 'Heslo', new_hash);
        console.log(`Password change`);
        return res.send({ success: true, message: "Heslo změněno" });
    } else {
        console.log(`Password change failed`);
        return res.status(400).send({ success: false, message: "Špatné heslo" });
    }
})

// add auction, returns auction id
// example:
// POST 
// {
// 	"nazev": "Chata za mestem",
// 	"vyvolavaci_cena": 150000,
//  "min_prihoz": 5000,
//  "object": 1,
//  "pravidlo": "otevrena",
//  "typ": "nabidkova",
//  "min_ucastniku": 2,
//  "adresa": "-",
//  "popis": "Chata 20km za městem, blízko řeky",
//  "tagy": ["Zahrada", "Studna"],
//  "objekt": {
//      nazev: 'Chata za mestem'
//      adresa: 'Kraví 19, Ostrava',
//      popis: 'popis nemovitosti',
//      foto_url: null
//   }
// }
router.post('/auction', async (req, res) => {

    let { nazev, vyvolavaci_cena, min_prihoz, pravidlo, typ, min_ucastniku, adresa, popis, tagy, objekt } = req.body;

    // add object
    const object_obj = {
        nazev: objekt.nazev,
        adresa: objekt.adresa,
        popis: objekt.popis,
        foto_url: objekt.foto_url
    };

    const obj_valid = validation.new_object(object_obj);
    if (!obj_valid) {
        console.log(`Add auction invalid object values`);
        return res.status(400).send({ success: false, message: "Špatné hodnoty objektu" });
    }

    const awaited_res_obj = await db_auction.create_object(object_obj);
    const [obj_result, object_id] = awaited_res_obj;

    if (!obj_result) {
        console.log(`Add object failed`);
        return res.status(400).send({ success: false, message: "Špatné hodnoty" });
    }

    // add auction
    if (min_ucastniku === undefined || min_ucastniku === null) {
        min_ucastniku = 1;
    }

    const auction_obj = {
        autor: req.user.id,
        nazev,
        vyvolavaci_cena,
        min_prihoz,
        pravidlo,
        typ,
        min_ucastniku,
        stav: 'neschvalena',
        adresa,
        popis,
        object_id
    };

    const auction_valid = validation.new_auction(auction_obj);
    if (!auction_valid) {
        console.log(`Add auction invalid values`);
        return res.status(400).send({ success: false, message: "Špatné hodnoty aukce" });
    }

    const awaited_res = await db_auction.create_auction(auction_obj);
    const [result, auction_id] = awaited_res;
    if (!result) {
        console.log(`Add auction invalid values`);
        return res.status(400).send({ success: false, message: "Špatné hodnoty" });
    }

    console.log(`Auction added`);
    const results = await db_auction.add_tags(auction_id, tagy);

    await Promise.all(results)
        .then((values) => {
            const all_tags_added = values.every((val) => { return val; });
            if (all_tags_added) {
                console.log(`Tags added`);
                return res.send({ success: true, message: "Aukce přidána", data: auction_id });
            } else {
                console.log(`Adding tags failed`);
                return res.status(400).send({ success: false, message: "Špatné hodnoty" });
            }
        });

})

// add object
// example:
// POST 
// {
//    nazev: 'Chata za mestem'
//    adresa: 'Kraví 19, Ostrava',
//    popis: 'popis nemovitosti',
//    foto_url: null
// }
router.post('/object', async (req, res) => {

    let { nazev, adresa, popis, foto_url } = req.body;

    // add object
    const object_obj = {
        nazev,
        adresa,
        popis,
        foto_url
    };

    const obj_valid = validation.new_object(object_obj);
    if (!obj_valid) {
        console.log(`Add object invalid values`);
        return res.status(400).send({ success: false, message: "Špatné hodnoty" });
    }

    const awaited_res_obj = await db_auction.create_object(object_obj);
    const [obj_result, object_id] = awaited_res_obj;

    if (!obj_result) {
        console.log(`Add object failed`);
        return res.status(400).send({ success: false, message: "Špatné hodnoty" });
    }

    return res.send({ success: true, message: "Objekt přidán", data: object_id });

})

// list auctions user is part of
// example:
// GET
router.get('/auctions-member', async (req, res) => {

    const rows = await db_auction.get_auctions_user_participates(req.user.id);
    return res.send({ success: true, message: "Zúčastněné aukce", data: rows });
})

// list users auctions (author) 
// example:
// GET
router.get('/my-auctions', async (req, res) => {

    const rows = await db_auction.get_my_auctions(req.user.id);
    return res.send({ success: true, message: "Mé Aukce", data: rows });
})

// returns true if user can join auction for every auction
// example:
// POST
// {
//     auctions: [1, 2, 3, 4, 5, 6, 2000]
// }
router.post('/can-join-auctions', async (req, res) => {

    const { auctions } = req.body;

    const rows = await db_auction.user_can_join_auctions(req.user.id, auctions);
    return res.send({ success: true, message: "Can join", data: rows });
})

// change user details (exact column names as in DB)
// example:
// POST 
// {
//  "password": "oldpasswordtoconfirm",
//  "user_data": {
//      "Typ": "licitator"
//  }
// }
router.post('/change-user-data', async (req, res) => { // todo validation
    const { password, user_data } = req.body;

    const valid = validation.change_user_data(user_data);
    if (!valid) {
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }

    // check password
    const old_pass_matches = await compare_passwords(password, req.user.heslo);
    if (!old_pass_matches) {
        return res.status(400).send({ success: false, message: "Špatné heslo" });
    }

    let properties = { // do not let user change his permissions
        username: user_data.username,
        jmeno: user_data.jmeno,
        prijmeni: user_data.prijmeni,
        email: user_data.email,
    }

    // delete undefined
    Object.keys(properties).forEach(key => properties[key] === undefined ? delete properties[key] : {});

    if (user_data.heslo) {
        // encrypt and set
        const new_hash = await hash_password(user_data.heslo);
        const password_update_result = db_users.set_user_property(req.user.id, 'Heslo', new_hash);
        if (!password_update_result) {
            return res.status(400).send({ success: false, message: "Neplatný požadavek" });
        }
    }

    let result = true;

    for (key of Object.keys(properties)) {
        if (!properties[key]) {
            continue;
        }
        result &= await db_users.set_user_property(req.user.id, key, properties[key]); // todo can promise.all mess up?
    }

    if (result) {
        console.log(`Change user data: success (${Object.keys(properties)}${user_data.heslo ? " , heslo" : ""})`);
        return res.send({ success: true, message: "Změna provedena" });
    } else {
        console.log(`Change user data: failure`);
        return res.status(400).send({ success: false, message: "Neplatný požadavek" });
    }
})

module.exports = router;
