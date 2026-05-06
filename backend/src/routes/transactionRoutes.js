const express = require("express");

const {
    transferMoney
} = require("../controllers/transactionController");

const router = express.Router();

router.post("/transfer", transferMoney);

module.exports = router;