const db = require("../config/db");

exports.applyLoan = (req, res) => {

    const {
        customer_id,
        loan_amount,
        interest_rate
    } = req.body;

    const sql = `
        INSERT INTO loans
        (customer_id, loan_amount, interest_rate)
        VALUES (?, ?, ?)
    `;

    db.query(
        sql,
        [customer_id, loan_amount, interest_rate],
        (err, result) => {

            if (err) {
                return res.status(500).json(err);
            }

            res.status(201).json({
                message: "Loan Application Submitted"
            });
        }
    );
};

exports.getLoans = (req, res) => {

    const sql = `SELECT * FROM loans`;

    db.query(sql, (err, result) => {

        if (err) {
            return res.status(500).json(err);
        }

        res.status(200).json(result);
    });
};