const { use_db } = require("../../config/db_pool");

const get_school_queries = async (req, res) => {

  let sql = `select * from queries where subject = 'Request school account'`;

  const run_query = await use_db(sql);
  console.log(run_query);
  res.json(run_query.rows);
};

module.exports = {
  get_school_queries,
};
