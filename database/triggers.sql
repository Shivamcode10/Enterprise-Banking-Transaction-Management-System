DELIMITER $$

CREATE TRIGGER transaction_audit_trigger
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (
        account_id,
        action_type,
        description
    )
    VALUES (
        NEW.sender_account,
        'TRANSACTION',
        CONCAT(
            'Transaction of amount ',
            NEW.amount,
            ' completed'
        )
    );
END $$

DELIMITER ;