const express = require('express');
const router = express.Router();
const {add_teacher} = require('../../controllers/add_teacher')

router.route('/').post(add_teacher)

module.exports = router;
