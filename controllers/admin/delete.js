const { use_db } = require("../../config/db_pool");

const deleteAdmin = async (req, res) => {
  req_id = await req.params.id;
  await use_db(`delete from admins where admin_id = ${req_id}`).then(
    await use_db(`delete from users where user_id = ${req_id}`)
  );
  res.status(200).json({ status: 200 });
  return;
};
module.exports = {
  deleteAdmin,
};  
