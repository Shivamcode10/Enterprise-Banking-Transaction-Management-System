const db = require("../config/db");

exports.createAccount = (req, res) => {
    const {
        customer_id,
        account_number,
        account_type,
        balance
    } = req.body;

    const sql = `
        INSERT INTO accounts
        (customer_id, account_number, account_type, balance)
        VALUES (?, ?, ?, ?)
    `;

    db.query(
        sql,
        [customer_id, account_number, account_type, balance],
        (err, result) => {
            if (err) {
                return res.status(500).json(err);
            }

            res.status(201).json({
                message: "Account Created Successfully"
            });
        }
    );
};

exports.getAllAccounts = (req, res) => {
    const sql = "SELECT * FROM accounts";

    db.query(sql, (err, result) => {
        if (err) {
            return res.status(500).json(err);
        }

        res.status(200).json(result);
    });
};