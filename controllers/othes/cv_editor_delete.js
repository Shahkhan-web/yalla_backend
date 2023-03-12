const { use_db } = require("../../config/db_pool");

const delete_gender = async (req, res) => {
  let data = await req.body;
  console.log(data);
  try {
    let sql = `delete from teacher_options where gender = '${data[0]}'`;
    console.log(sql);
    const update = await use_db(sql);
    if (update.command === "DELETE") {
      res.status(200).json(update);
    } else {
      res.status(401).json({ err: "an error has occurred try again later" });
    }
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};
const delete_curriculem = async (req, res) => {
  let data = await req.body;
  console.log(data);
  try {
    let sql = `delete from teacher_options where curriclum = '${data[0]}'`;
    console.log(sql);
    const update = await use_db(sql);
    if (update.command === "DELETE") {
      res.status(200).json(update);
    } else {
      res.status(401).json({ err: "an error has occurred try again later" });
    }
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};
const delete_marital_status = async (req, res) => {
  let data = await req.body;
  console.log(data);
  try {
    let sql = `delete from teacher_options where marital_status = '${data[0]}'`;
    console.log(sql);
    const update = await use_db(sql);
    if (update.command === "DELETE") {
      res.status(200).json(update);
    } else {
      res.status(401).json({ err: "an error has occurred try again later" });
    }
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};
const delete_teaching_exp = async (req, res) => {
  let data = await req.body;
  console.log(data);
  try {
    let sql = `delete from teacher_options where teaching_exp = '${data[0]}'`;
    console.log(sql);
    const update = await use_db(sql);
    if (update.command === "DELETE") {
      res.status(200).json(update);
    } else {
      res.status(401).json({ err: "an error has occurred try again later" });
    }
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};
const delete_salary_expectations = async (req, res) => {
  let data = await req.body;
  console.log(data);
  try {
    let sql = `delete from teacher_options where salary_expectations = '${data[0]}'`;
    console.log(sql);
    const update = await use_db(sql);
    if (update.command === "DELETE") {
      res.status(200).json(update);
    } else {
      res.status(401).json({ err: "an error has occurred try again later" });
    }
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};
const delete_current_salary = async (req, res) => {
  let data = await req.body;
  console.log(data);
  try {
    let sql = `delete from teacher_options where current_salary = '${data[0]}'`;
    console.log(sql);
    const update = await use_db(sql);
    if (update.command === "DELETE") {
      res.status(200).json(update);
    } else {
      res.status(401).json({ err: "an error has occurred try again later" });
    }
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};
const delete_qualification = async (req, res) => {
  let data = await req.body;
  console.log(data);
  try {
    let sql = `delete from teacher_options where qualification = '${data[0]}'`;
    console.log(sql);
    const update = await use_db(sql);
    if (update.command === "DELETE") {
      res.status(200).json(update);
    } else {
      res.status(401).json({ err: "an error has occurred try again later" });
    }
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};
const delete_age_groups_taught = async (req, res) => {
  let data = await req.body;
  console.log(data);
  try {
    let sql = `delete from teacher_options where age_groups_taught = '${data[0]}'`;
    console.log(sql);
    const update = await use_db(sql);
    if (update.command === "DELETE") {
      res.status(200).json(update);
    } else {
      res.status(401).json({ err: "an error has occurred try again later" });
    }
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};
const delete_subjects = async (req, res) => {
  let data = await req.body;
  console.log(data);
  try {
    let sql = `delete from teacher_options where subjects = '${data[0]}'`;
    console.log(sql);
    const update = await use_db(sql);
    if (update.command === "DELETE") {
      res.status(200).json(update);
    } else {
      res.status(401).json({ err: "an error has occurred try again later" });
    }
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};
const delete_english = async (req, res) => {
  let data = await req.body;
  console.log(data);
  try {
    let sql = `delete from teacher_options where english = '${data[0]}'`;
    console.log(sql);
    const update = await use_db(sql);
    if (update.command === "DELETE") {
      res.status(200).json(update);
    } else {
      res.status(401).json({ err: "an error has occurred try again later" });
    }
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};
const delete_license = async (req, res) => {
  let data = await req.body;
  console.log(data);
  try {
    let sql = `delete from teacher_options where license = '${data[0]}'`;
    console.log(sql);
    const update = await use_db(sql);
    if (update.command === "DELETE") {
      res.status(200).json(update);
    } else {
      res.status(401).json({ err: "an error has occurred try again later" });
    }
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
}; 
const delete_availability = async (req, res) => {
  let data = await req.body;
  console.log(data);
  try {
    let sql = `delete from teacher_options where availibility = '${data[0]}'`;
    console.log(sql);
    const update = await use_db(sql);
    if (update.command === "DELETE") {
      res.status(200).json(update);
    } else {
      res.status(401).json({ err: "an error has occurred try again later" });
    }
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};

module.exports = {
  delete_marital_status,
  delete_teaching_exp,
  delete_availability,
  delete_salary_expectations,
  delete_current_salary,
  delete_qualification,
  delete_age_groups_taught,
  delete_subjects,
  delete_english,
  delete_license,
  delete_gender,
  delete_curriculem
};
