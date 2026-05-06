const express = require("express");

const {
    applyLoan,
    getLoans
} = require("../controllers/loanController");

const router = express.Router();

router.post("/apply", applyLoan);
router.get("/", getLoans);

module.exports = router;