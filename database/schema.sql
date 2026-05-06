CREATE DATABASE IF NOT EXISTS enterprise_banking_system;

USE enterprise_banking_system;

-- =========================================
-- CUSTOMERS TABLE
-- =========================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,

    full_name VARCHAR(100) NOT NULL,

    email VARCHAR(100) UNIQUE NOT NULL,

    phone VARCHAR(15) UNIQUE NOT NULL,

    address TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================================
-- ACCOUNTS TABLE
-- =========================================

CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,

    customer_id INT NOT NULL,

    account_number VARCHAR(20) UNIQUE NOT NULL,

    account_type ENUM('SAVINGS', 'CURRENT') NOT NULL,

    balance DECIMAL(15,2) DEFAULT 0.00,

    status ENUM('ACTIVE', 'BLOCKED', 'CLOSED')
    DEFAULT 'ACTIVE',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
    ON DELETE CASCADE
);

-- =========================================
-- TRANSACTIONS TABLE
-- =========================================

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,

    sender_account INT,

    receiver_account INT,

    transaction_type ENUM(
        'DEPOSIT',
        'WITHDRAW',
        'TRANSFER'
    ) NOT NULL,

    amount DECIMAL(15,2) NOT NULL,

    transaction_status ENUM(
        'SUCCESS',
        'FAILED',
        'PENDING'
    ) DEFAULT 'SUCCESS',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (sender_account)
    REFERENCES accounts(account_id),

    FOREIGN KEY (receiver_account)
    REFERENCES accounts(account_id)
);

-- =========================================
-- LOANS TABLE
-- =========================================

CREATE TABLE loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,

    customer_id INT NOT NULL,

    loan_amount DECIMAL(15,2) NOT NULL,

    interest_rate DECIMAL(5,2) NOT NULL,

    loan_status ENUM(
        'PENDING',
        'APPROVED',
        'REJECTED'
    ) DEFAULT 'PENDING',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

-- =========================================
-- AUDIT LOGS TABLE
-- =========================================

CREATE TABLE audit_logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,

    account_id INT,

    action_type VARCHAR(50),

    description TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (account_id)
    REFERENCES accounts(account_id)
);

-- =========================================
-- FRAUD DETECTION TABLE
-- =========================================

CREATE TABLE fraud_detection (
    fraud_id INT PRIMARY KEY AUTO_INCREMENT,

    transaction_id INT,

    fraud_reason VARCHAR(255),

    detected_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (transaction_id)
    REFERENCES transactions(transaction_id)
);