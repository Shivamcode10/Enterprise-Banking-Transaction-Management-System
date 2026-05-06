const db = require("../config/db");

const getAccountsService = () => {

    return new Promise((resolve, reject) => {

        db.query(
            "SELECT * FROM accounts",
            (err, result) => {

                if (err) {
                    reject(err);
                } else {
                    resolve(result);
                }
            }
        );
    });
};

module.exports = {
    getAccountsService
};