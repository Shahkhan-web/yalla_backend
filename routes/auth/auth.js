const express = require("express");
const router = express.Router();
const teacherauthController = require("../../controllers/auth/teacherAuthController");
const authController = require("../../controllers/auth/mainAuthController");
const guestAuth = require("../../controllers/auth/guestAuth");

router.post("/teacher", teacherauthController.handleLogin);

router.post("/", authController.handleLogin);

router.get("/guest", guestAuth.handleLogin);

module.exports = router;
