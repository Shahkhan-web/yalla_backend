const express = require("express");
const router = express.Router();
const get_queryController = require("../../../controllers/othes/get_queries");
const delete_queryController = require("../../../controllers/othes/delete_queryController");
const verifyRoles = require("../../../middleware/verifyRoles");
const ROLES_LIST = require("../../../config/roles_list");


router
  .route("/schools")
  .get(verifyRoles(ROLES_LIST.admin), get_queryController.get_school_queries);
router
  .route("/schools/:id")
  .delete(
    verifyRoles(ROLES_LIST.admin),
    delete_queryController.delete_school_query
  );

module.exports = router;
