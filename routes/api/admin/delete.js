const express = require("express");
const router = express.Router();
const ROLES_LIST = require("../../../config/roles_list");
const verifyRoles = require("../../../middleware/verifyRoles");
const deleteAdmin = require("../../../controllers/admin/delete");

router
  .route("/:id")
  .delete(
    verifyRoles(ROLES_LIST.admin),
    deleteAdmin.deleteAdmin
  );
module.exports = router;
