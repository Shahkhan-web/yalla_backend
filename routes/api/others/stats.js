const express = require('express');
const router = express.Router();
const statsController = require('../../../controllers/othes/stats'); 

router.route('/').get(statsController.getstats);

module.exports = router;