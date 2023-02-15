const { use_db } = require("../../config/db_pool");

const delete_gender = async (req, res) => {
  let data = await req.body;
  console.log(data)
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

module.exports = {
  delete_gender,
};
