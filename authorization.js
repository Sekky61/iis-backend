const db_users = require('./db/users');

exports.login = async (req, res, next) => {
    const uid = req.session.uid;
    let user = await db_users.get_user_by_id(uid);
    if (user) {
        req.user = user; // user obj available in every authorized query
        console.log(`Auth: ${user.iduzivatele} ${user.username}`);
        next();
    } else {
        return res.status(401).send({
            error: "Unauthorized, need to be logged in"
        });
    }
};

// requires auth.login as previous middleware
exports.licit = async (req, res, next) => {
    if (req.user.typ == 'licitator' || req.user.typ == 'admin') {
        next()
    } else {
        return res.status(401).json({
            error: "Unauthorized, need to be licitator"
        });
    }
};

// requires auth.login as previous middleware
exports.admin = async (req, res, next) => {
    if (req.user.typ == 'admin') {
        next()
    } else {
        return res.status(401).json({
            error: "Unauthorized, need to be admin"
        });
    }
};
