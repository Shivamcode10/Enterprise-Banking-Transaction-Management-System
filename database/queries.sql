-- Total Transactions
SELECT COUNT(*) AS total_transactions
FROM transactions;

-- Total Bank Balance
SELECT SUM(balance) AS total_bank_balance
FROM accounts;

-- High Value Transactions
SELECT *
FROM transactions
WHERE amount > 50000;

-- Loan Analytics
SELECT loan_status, COUNT(*) AS total
FROM loans
GROUP BY loan_status;