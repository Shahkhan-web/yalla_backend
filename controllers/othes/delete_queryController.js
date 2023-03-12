const { use_db } = require("../../config/db_pool");

const delete_school_query = async (req, res) => {
  req_id = await req.params.id;
  await use_db(`delete from queries where id = ${req_id}`)
  res.status(200).json({ status: 200 });
  return;
};
module.exports = {
    delete_school_query,
};
