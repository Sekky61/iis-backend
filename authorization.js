const db_users = require('./db/users');

exports.login = async (req, res, next) => {
    try {
        const uid = req.session.uid;
        console.log("--- auth");
        console.log(uid);
        let user = await db_users.get_user_by_id(uid);
        console.log(user);
        if (user) {
            req.user = user;
            console.log("User validated " + user.username);
            next();
        } else {
            throw 'Invalid user ID';
        }
    } catch {
        console.log(`Invalid request ${req.url} - user not logged in`);
        res.status(401).json({
            error: "Unauthorized, need to be logged in"
        });
    }
};

exports.licit = async (req, res, next) => {
    if (req.user.typ == 'licitator' || req.user.typ == 'admin') {
        next()
    } else {
        res.status(401).json({
            error: "Unauthorized, need to be licitator"
        });
    }
};

exports.admin = async (req, res, next) => {
    if (req.user.typ == 'admin') {
        next()
    } else {
        res.status(401).json({
            error: "Unauthorized, need to be admin"
        });
    }
};
