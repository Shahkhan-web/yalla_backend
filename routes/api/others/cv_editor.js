const express = require("express");
const ROLES_LIST = require("../../../config/roles_list");
const router = express.Router();
const edit_cv_Controller = require("../../../controllers/othes/cv_editor");
const delete_cv_Controller = require("../../../controllers/othes/cv_editor_delete")
const verifyRoles = require("../../../middleware/verifyRoles");

router.route("/marital_status").post(verifyRoles(ROLES_LIST.admin), edit_cv_Controller.update_marital_status);
router.route("/teaching_exp").post(verifyRoles(ROLES_LIST.admin), edit_cv_Controller.update_teaching_exp);
router.route("/availibility").post(verifyRoles(ROLES_LIST.admin), edit_cv_Controller.update_availibility);
router.route("/salary_expectations").post(verifyRoles(ROLES_LIST.admin), edit_cv_Controller.update_salary_expectations);
router.route("/current_salary").post(verifyRoles(ROLES_LIST.admin), edit_cv_Controller.update_current_salary);
router.route("/qualification").post(verifyRoles(ROLES_LIST.admin), edit_cv_Controller.update_qualification);
router.route("/age_groups_taught").post(verifyRoles(ROLES_LIST.admin), edit_cv_Controller.update_age_groups_taught);
router.route("/subjects").post(verifyRoles(ROLES_LIST.admin), edit_cv_Controller.update_subjects);
router.route("/english").post(verifyRoles(ROLES_LIST.admin), edit_cv_Controller.update_english);
router.route("/license").post(verifyRoles(ROLES_LIST.admin), edit_cv_Controller.update_license);
router.route("/gender").post(verifyRoles(ROLES_LIST.admin), edit_cv_Controller.update_gender);
router.route("/curriculum").post(verifyRoles(ROLES_LIST.admin), edit_cv_Controller.update_curriclum);

router.route("/marital_status").delete(verifyRoles(ROLES_LIST.admin), delete_cv_Controller.delete_marital_status);
router.route("/teaching_exp").delete(verifyRoles(ROLES_LIST.admin), delete_cv_Controller.delete_teaching_exp);
router.route("/availibility").delete(verifyRoles(ROLES_LIST.admin), delete_cv_Controller.delete_availability);
router.route("/salary_expectations").delete(verifyRoles(ROLES_LIST.admin), delete_cv_Controller.delete_salary_expectations);
router.route("/current_salary").delete(verifyRoles(ROLES_LIST.admin), delete_cv_Controller.delete_current_salary);
router.route("/qualification").delete(verifyRoles(ROLES_LIST.admin), delete_cv_Controller.delete_qualification);
router.route("/age_groups_taught").delete(verifyRoles(ROLES_LIST.admin), delete_cv_Controller.delete_age_groups_taught);
router.route("/subjects").delete(verifyRoles(ROLES_LIST.admin), delete_cv_Controller.delete_subjects);
router.route("/english").delete(verifyRoles(ROLES_LIST.admin), delete_cv_Controller.delete_english);
router.route("/license").delete(verifyRoles(ROLES_LIST.admin), delete_cv_Controller.delete_license);
router.route("/gender").delete(verifyRoles(ROLES_LIST.admin), delete_cv_Controller.delete_gender);
router.route("/curriculum").delete(verifyRoles(ROLES_LIST.admin), delete_cv_Controller.delete_curriculem);

module.exports = router;
