const express = require('express');
const router = express.Router();
const get_queryController = require('../../../controllers/othes/get_queries'); 

router.route('/schools').get(get_queryController.get_school_queries);

module.exports = router;