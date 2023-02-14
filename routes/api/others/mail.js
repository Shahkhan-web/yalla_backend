const express = require("express");
const ROLES_LIST = require("../../../config/roles_list");
const router = express.Router();
const mailerControl = require("../../../controllers/othes/mailerControl");
const verifyRoles = require("../../../middleware/verifyRoles");

router
  .route("/:id")
  .post(
    verifyRoles(
      ROLES_LIST.admin,
      ROLES_LIST.teacher,
      ROLES_LIST.school,
      ROLES_LIST.guest
    ),
    mailerControl.mail
  );

module.exports = router;
