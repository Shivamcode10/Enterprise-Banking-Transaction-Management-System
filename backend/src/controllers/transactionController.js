const db = require("../config/db");

exports.transferMoney = (req, res) => {
    const {
        sender_account,
        receiver_account,
        amount
    } = req.body;

    db.beginTransaction((err) => {
        if (err) {
            return res.status(500).json(err);
        }

        const deductQuery = `
            UPDATE accounts
            SET balance = balance - ?
            WHERE account_id = ?
        `;

        db.query(
            deductQuery,
            [amount, sender_account],
            (err) => {

                if (err) {
                    return db.rollback(() => {
                        res.status(500).json(err);
                    });
                }

                const addQuery = `
                    UPDATE accounts
                    SET balance = balance + ?
                    WHERE account_id = ?
                `;

                db.query(
                    addQuery,
                    [amount, receiver_account],
                    (err) => {

                        if (err) {
                            return db.rollback(() => {
                                res.status(500).json(err);
                            });
                        }

                        const transactionQuery = `
                            INSERT INTO transactions
                            (sender_account, receiver_account, transaction_type, amount)
                            VALUES (?, ?, 'TRANSFER', ?)
                        `;

                        db.query(
                            transactionQuery,
                            [sender_account, receiver_account, amount],
                            (err) => {

                                if (err) {
                                    return db.rollback(() => {
                                        res.status(500).json(err);
                                    });
                                }

                                db.commit((err) => {
                                    if (err) {
                                        return db.rollback(() => {
                                            res.status(500).json(err);
                                        });
                                    }

                                    res.status(200).json({
                                        message: "Transaction Successful"
                                    });
                                });
                            }
                        );
                    }
                );
            }
        );
    });
};