const express = require("express");
const router = express.Router();
const ROLES_LIST = require("../../../config/roles_list");
const verifyRoles = require("../../../middleware/verifyRoles");
const deleteteacher = require("../../../controllers/teachers/delete_teacher");

router
  .route("/:id")
  .delete(
    verifyRoles(ROLES_LIST.admin),
    deleteteacher.deleteteacher
  );
module.exports = router;
