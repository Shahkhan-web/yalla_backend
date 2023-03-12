const express = require("express");
const router = express.Router();

const {
  getsubjects,
  getteaching_exp,
  getsalary_expectations,
  getcurrent_salary,
  getavailibility,
  getmarital_status,
  getcountryofqualification,
  getqualification,
  getage_groups_taught,
  getdesired_location,
  getnationality,
  getenglish,
  getcurrent_locations,
  getall,
  getgenders,
  getcurriculems,
  getlicense
} = require("../../../controllers/teachers/teacher_options");

router.route("/").get(getall);

router.route("/getsubjects").get(getsubjects);
router.route("/getteaching_exp").get(getteaching_exp);
router.route("/getsalary_expectations").get(getsalary_expectations);
router.route("/getcurrent_salary").get(getcurrent_salary);
router.route("/getavailibility").get(getavailibility);
router.route("/getmarital_status").get(getmarital_status);
router.route("/getcountryofqualification").get(getcountryofqualification);
router.route("/getqualification").get(getqualification)
router.route("/getage_groups_taught").get(getage_groups_taught)
router.route("/getdesired_locations").get(getdesired_location)
router.route("/getnationality").get(getnationality)
router.route("/getenglish").get(getenglish)
router.route("/getcurrent_location").get(getcurrent_locations)
router.route("/getgender").get(getgenders)
router.route('/getcurriculems').get(getcurriculems)
router.route('/getlicense').get(getlicense)

module.exports = router;
