const express = require("express");

const {
    createAccount,
    getAllAccounts
} = require("../controllers/accountController");

const router = express.Router();

router.post("/create", createAccount);
router.get("/", getAllAccounts);

module.exports = router;