const { use_db } = require("../../config/db_pool");

const deleteteacher = async (req, res) => {
  req_id = await req.params.id;
  await use_db(`delete from teachers_data where user_id = ${req_id}`).then(
    await use_db(`delete from users where user_id = ${req_id}`)
  );
  res.status(200).json({ status: 200 });
  return;
};
module.exports = {
  deleteteacher,
};
