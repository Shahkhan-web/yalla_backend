const { use_db } = require("../../config/db_pool");

const getTeacher = async (req, res) => {
  let req_id = req.params.id;
  const data = await use_db(
    `select * from teachers_data where user_id = ${req_id}`
  );
  if (!data.rows || data?.rows.length < 1 || data.rows === []) {
    res.status(401).send("no user found with current Id");
  } else {
    res.json(data.rows);
  }
};
const getAllTeachers = async (req, res) => {
  const data = await use_db(`select * from teachers_data`);
  if (!data.rows || data?.rows.length < 1 || data.rows === []) {
    res.status(401).send("an error occured or no available data found");
  } else {
    res.json(data.rows);
  }
};
const getTeacheremail = async (req, res) => {
  let req_id = req.params.id;
  console.log("id", req_id);
  const data = await use_db(
    `select email from users where user_id = ${req_id}`
  );
  if (!data.rows || data?.rows.length < 1 || data.rows === []) {
    res.status(401).send("an error occured or no available data found");
  } else {
    res.json(data.rows);
  }
};
const filterTeacher = async (req, res) => {
  let filter_options = req.body;
  const mutated_filtered_data = await filterData(filter_options);
  res.status(200).json(mutated_filtered_data);
};

const filterData = async (data) => {
  if (!data) {
    console.error("Error: No data provided.");
    return;
  }

  const keys = Object.keys(data);
  let sql = `SELECT * FROM teachers_data WHERE `;

  for (let i = 0; i < keys.length; i++) {
    if (!data[keys[i]] || !data[keys[i]].name) {
      console.warn(`Warning: ${keys[i]} is null or undefined. Skipping...`);
      continue;
    }

    let value = data[keys[i]].value;
    let operator = 'LIKE';
    if (typeof value === 'boolean') {
      value = JSON.stringify(value);
      operator = '=';
    }

    sql += `${data[keys[i]].name} ${operator} '${operator==='LIKE'?"%"+value+"%":value}'`;
    if (i !== keys.length - 1) {
      sql += ` AND `;
    }
  } 

  if (sql.endsWith("AND ")) {
    sql = sql.substring(0, sql.length - 4);
  }

  sql += `;`;

  const sqled_data = await use_db(sql);
  console.log(sql);
  return sqled_data.rows;
};

module.exports = {
  getTeacher,
  getAllTeachers,
  getTeacheremail,
  filterTeacher,
};
