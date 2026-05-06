const authMiddleware = (req, res, next) => {

    console.log("Authentication Middleware Executed");

    next();
};

module.exports = authMiddleware;