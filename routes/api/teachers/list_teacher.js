const express = require("express");
const router = express.Router();
const ROLES_LIST = require("../../../config/roles_list");
const verifyRoles = require("../../../middleware/verifyRoles");
const filterTeachers = require("../../../controllers/teachers/filter_Teachers");

router
  .route("/")
  .get(
    verifyRoles(ROLES_LIST.admin, ROLES_LIST.teacher, ROLES_LIST.school),
    filterTeachers.getAllTeachers
  );
router
  .route("/email/:id")
  .get(
    verifyRoles(ROLES_LIST.admin, ROLES_LIST.teacher, ROLES_LIST.school),
    filterTeachers.getTeacheremail
  );

  router
  .route("/:id")
  .get(
    verifyRoles(ROLES_LIST.admin, ROLES_LIST.teacher, ROLES_LIST.school),
    filterTeachers.getTeacher
  );
  router
  .route("/filter")
  .post(
    verifyRoles(ROLES_LIST.admin, ROLES_LIST.school),
    filterTeachers.filterTeacher
  );

module.exports = router;
