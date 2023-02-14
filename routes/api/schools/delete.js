const express = require("express");
const router = express.Router();
const ROLES_LIST = require("../../../config/roles_list");
const verifyRoles = require("../../../middleware/verifyRoles");
const deleteSchool = require("../../../controllers/schools/deleteSchool");

router
  .route("/:id")
  .delete(
    verifyRoles(ROLES_LIST.admin),
    deleteSchool.deleteSchool 
  );
module.exports = router;
