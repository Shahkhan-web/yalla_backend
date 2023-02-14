const express = require("express");
const router = express.Router();
const password_reset = require("../../controllers/auth/password_reset");

router.route("/").post(password_reset.handle_reset);

router.route("/reset/:token").post(password_reset.handle_reset_mailed);

module.exports = router;
