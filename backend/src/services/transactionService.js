const db = require("../config/db");

const getTransactionsService = () => {

    return new Promise((resolve, reject) => {

        db.query(
            "SELECT * FROM transactions",
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
    getTransactionsService
};