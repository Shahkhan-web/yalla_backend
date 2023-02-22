const express = require('express');
const router = express.Router();
const send_query = require('../../../controllers/othes/send_query'); 

router.route('/').post(send_query.send_query);

module.exports = router;