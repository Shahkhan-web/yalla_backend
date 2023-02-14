const express = require("express");
const router = express.Router();
const registerController = require("../controllers/registerController");
const registerTeacher = require("../controllers/teachers/registerTeacher");
const registerAdmin = require("../controllers/admin/registerAdmin");
const registerSchool = require("../controllers/schools/registerSchools");
router.post("/teacher", registerTeacher.add_teacher);
router.post("/schools", registerSchool.handleNewSchool);
router.post("/admin", registerAdmin.handleNewAdmin);
router.post("/", registerController.handleNewUser);

module.exports = router;
