# Enterprise Banking Transaction Management System

An enterprise-level banking transaction management system built using Node.js, Express.js, and MySQL focused on secure transaction processing, ACID-compliant database operations, audit logging, and backend API integration.

The project simulates real-world banking workflows including secure money transfers, account management, loan processing, and transaction monitoring.

---

# Key Features

- Customer Account Management
- Secure Money Transfers
- Loan Management System
- Transaction History Tracking
- Trigger-Based Audit Logging
- Stored Procedures
- ACID Transactions & Rollback Handling
- REST API Integration
- Relational Database Design

---

# Real-World Problems Solved

### Transaction Failure Prevention
Implemented ACID transactions and rollback mechanisms to prevent inconsistent banking operations during money transfers.

### Banking Audit Compliance
Used database triggers to automatically generate audit logs for transaction tracking and monitoring.

### Data Integrity & Consistency
Implemented foreign keys, constraints, and relational schema design to maintain secure and consistent banking records.

---

# Tech Stack

## Backend
- Node.js
- Express.js

## Database
- MySQL

## Tools
- Postman
- MySQL Workbench
- VS Code

---

# Advanced SQL Concepts Implemented

- Stored Procedures
- Database Triggers
- ACID Properties
- Commit & Rollback Transactions
- Foreign Key Constraints
- Relational Database Design
- Query Optimization

---

# Main Database Tables

- customers
- accounts
- transactions
- loans
- audit_logs
- fraud_detection

---

# API Endpoints

## Accounts
```bash
GET  /api/accounts
POST /api/accounts/create
```

## Transactions
```bash
POST /api/transactions/transfer
```

## Loans
```bash
POST /api/loans/apply
```

---

# Run Project

## Install Dependencies
```bash
npm install
```

## Configure Environment Variables
Create `.env`

```env
PORT=5000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=enterprise_banking_system
```

## Start Backend Server
```bash
npm run dev
```

---

# Resume Highlights

- Enterprise SQL Development
- Banking Transaction Management
- Backend API Engineering
- ACID-Compliant Operations
- Trigger-Based Automation
- Relational Database Architecture

---

# Author

Shivam Lahane