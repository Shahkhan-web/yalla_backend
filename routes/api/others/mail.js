const express = require("express");
const ROLES_LIST = require("../../../config/roles_list");
const router = express.Router();
const mailerControl = require("../../../controllers/othes/mailerControl");
const verifyRoles = require("../../../middleware/verifyRoles");

router
  .route("/pure/:id")
  .post(
    verifyRoles(
      ROLES_LIST.admin,
      ROLES_LIST.teacher,
      ROLES_LIST.school,
      ROLES_LIST.guest
    ),
    mailerControl.mail
  );
router
  .route("/school_wishes")
  .post(
    verifyRoles(
      ROLES_LIST.admin,
      ROLES_LIST.teacher,
      ROLES_LIST.school,
      ROLES_LIST.guest
    ),
    mailerControl.school_wish
  );

module.exports = router;
