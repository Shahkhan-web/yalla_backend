const { use_db } = require("../../config/db_pool");

const add_testimonials = async (req, res) => {
  const { phone, email, subject, message, name } = req.body;
  let sql = `insert into testimonials (email,phone,subject,message,name) Values ('${email}','${phone}','${subject}','${message}','${name}')`;

  const run_query = await use_db(sql);
  if (run_query.command === "INSERT") {
    res.status(200).json({ Success: "data added successfully" });
    return;
  } else {
    res.status(500).json({ "internal error": "try again later" });
    return;
  }
};

module.exports = {
  add_testimonials,
};
