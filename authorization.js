const db_users = require('./db/users');

exports.login = async (req, res, next) => {
    try {
        const uid = req.session.uid;
        let user = await db_users.get_user_by_id(uid);
        if (user) {
            req.user = user;
            next();
        } else {
            throw 'Invalid user ID';
        }
    } catch {
        res.status(401).json({
            error: "Unauthorized, need to be logged in"
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
