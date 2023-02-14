const express = require('express');
const router = express.Router();
const teacherauthController = require('../../controllers/auth/teacherAuthController');
const authController = require('../../controllers/auth/mainAuthController');

router.post('/teacher', teacherauthController.handleLogin);

router.post('/', authController.handleLogin);

module.exports = router;