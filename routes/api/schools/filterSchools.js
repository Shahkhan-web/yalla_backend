const express = require("express");
const router = express.Router();
const ROLES_LIST = require("../../../config/roles_list");
const verifyRoles = require("../../../middleware/verifyRoles");
const filterSchools = require("../../../controllers/schools/filterSchools");

router
  .route("/")
  .get(
    verifyRoles(ROLES_LIST.admin),
    filterSchools.getallSchools
  );

module.exports = router;
