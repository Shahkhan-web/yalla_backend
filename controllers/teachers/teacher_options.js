const { use_db } = require("../../config/db_pool");

const getteaching_exp = async (req, res) => {
  await use_db(
    `select teaching_exp from teacher_options where teaching_exp != ''`
  ).then((i) => {
    res.json({ teaching_exp: i.rows });
  });
};
const getsubjects = async (req, res) => {
  await use_db(
    `select subjects from teacher_options where subjects != ''`
  ).then((i) => {
    res.json({ subjects: i.rows });
  });
};
const getsalary_expectations = async (req, res) => {
  await use_db(
    `select salary_expectations from teacher_options where salary_expectations != ''`
  ).then((i) => {
    res.json({ salary_expectations: i.rows });
  });
};
const getcurrent_salary = async (req, res) => {
  await use_db(
    `select current_salary from teacher_options where current_salary != ''`
  ).then((i) => {
    res.json({ current_salary: i.rows });
  });
};
const getavailibility = async (req, res) => {
  await use_db(
    `select availibility from teacher_options where availibility != ''`
  ).then((i) => {
    res.json({ availibility: i.rows });
  });
};
const getmarital_status = async (req, res) => {
  await use_db(
    `select marital_status from teacher_options where marital_status != ''`
  ).then((i) => {
    res.json({ marital_status: i.rows });
  });
};
const getcountryofqualification = async (req, res) => {
  await use_db(
    `select country_of_qualification from teacher_options where country_of_qualification != ''`
  ).then((i) => {
    res.json({ country_of_qualification: i.rows });
  });
};
const getqualification = async (req, res) => {
  await use_db(
    `select qualification from teacher_options where qualification != ''`
  ).then((i) => {
    res.json({ qualification: i.rows });
  });
};
const getage_groups_taught = async (req, res) => {
  await use_db(
    `select age_groups_taught from teacher_options where age_groups_taught != ''`
  ).then((i) => {
    res.json({ age_groups_taught: i.rows });
  });
};
const getdesired_location = async (req, res) => {
  await use_db(
    `select desired_location from teacher_options where desired_location != ''`
  ).then((i) => {
    res.json({ desired_location: i.rows });
  });
};
const getnationality = async (req, res) => {
  await use_db(
    `select nationality from teacher_options where nationality != ''`
  ).then((i) => {
    res.json({ nationality: i.rows });
  });
};
const getenglish = async (req, res) => {
  await use_db(`select english from teacher_options where english != ''`).then(
    (i) => {
      res.json({ english: i.rows });
    }
  );
};
const getcurrent_locations = async (req, res) => {
  await use_db(
    `select current_location from teacher_options where current_location != ''`
  ).then((i) => {
    res.json({ current_location: i.rows });
  });
};
const getgenders = async (req, res) => {
  await use_db(`select gender from teacher_options where gender != ''`).then(
    (i) => {
      res.json({ gender: i.rows });
    }
  );
};
const getcurriculems = async (req, res) => {
  await use_db(`select curriclum from teacher_options  where curriclum != ''`).then(
    (i) => {
      res.json({ curriculum: i.rows });
    }
  );
};
const getlicense = async (req, res) => {
  await use_db(`select license from teacher_options  where license != ''`).then(
    (i) => {
      res.json({ license: i.rows });
    }
  );
};
const getall = async (req, res) => {
  const subjects = await use_db(
    `select subjects from teacher_options where subjects != '';`
  );
  const teaching_exp = await use_db(
    `select teaching_exp from teacher_options where teaching_exp != ''`
  );
  const salary_expectations = await use_db(
    `select salary_expectations from teacher_options where salary_expectations != ''`
  );
  const current_salary = await use_db(
    `select current_salary from teacher_options where current_salary != ''`
  );
  const availibility = await use_db(
    `select availibility from teacher_options where availibility != ''`
  );
  const marital_status = await use_db(
    `select marital_status from teacher_options where marital_status != ''`
  );
  const countryofqualification = await use_db(
    `select country_of_qualification from teacher_options where country_of_qualification != ''`
  );
  const qualification = await use_db(
    `select qualification from teacher_options where qualification != ''`
  );
  const age_groups_taught = await use_db(
    `select age_groups_taught from teacher_options where age_groups_taught != ''`
  );
  const desired_location = await use_db(
    `select desired_location from teacher_options where desired_location != ''`
  );
  const nationality = await use_db(
    `select nationality from teacher_options where nationality != ''`
  );
  const english = await use_db(
    `select english from teacher_options where english != ''`
  );
  const current_locations = await use_db(
    `select current_location from teacher_options where current_location != ''`
  );
  const gender = await use_db(
    `select gender from teacher_options  where gender != ''`
  );
  const license = await use_db(
    `select license from teacher_options  where license != ''`
  );
  const curriculem = await use_db(
    `select curriclum from teacher_options  where curriclum != ''`
  );

  const data = {
    subjects: subjects.rows,
    teaching_experience: teaching_exp.rows,
    salary_expectations: salary_expectations.rows,
    current_salary: current_salary.rows,
    availibility: availibility.rows,
    marital_status: marital_status.rows,
    country_of_qualification: countryofqualification.rows,
    qualification: qualification.rows,
    age_groups_taught: age_groups_taught.rows,
    desired_location: desired_location.rows,
    nationality: nationality.rows,
    english: english.rows,
    current_locations: current_locations.rows,
    gender: gender.rows,
    curriculem: curriculem.rows,
    license: license.rows,
  };
  res.json(data);
};
module.exports = {
  getgenders,
  getlicense,
  getcurriculems,
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
};
