DELIMITER $$

CREATE PROCEDURE GetCustomerAccounts(IN customerId INT)
BEGIN
    SELECT *
    FROM accounts
    WHERE customer_id = customerId;
END $$

DELIMITER ;