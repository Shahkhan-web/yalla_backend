const express = require("express");
const router = express.Router();
const ROLES_LIST = require("../../../config/roles_list");
const verifyRoles = require("../../../middleware/verifyRoles");
const filterAdmins= require("../../../controllers/admin/filteradmin");

router
  .route("/")
  .get(
    verifyRoles(ROLES_LIST.admin),
    filterAdmins.getallAdmins
  );

module.exports = router;
