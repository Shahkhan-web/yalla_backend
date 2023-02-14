const express = require("express");
const router = express.Router();
const ROLES_LIST = require("../../../config/roles_list");
const verifyRoles = require("../../../middleware/verifyRoles");
const updateTeacher = require("../../../controllers/teachers/updateTeacher");

router
  .route("/:id")
  .post(
    verifyRoles(ROLES_LIST.admin, ROLES_LIST.teacher),
    updateTeacher.update
  );
router
  .route("/favourite/:id")
  .get (
    verifyRoles(ROLES_LIST.admin, ROLES_LIST.school),
    updateTeacher.togglefav
  );
module.exports = router;
