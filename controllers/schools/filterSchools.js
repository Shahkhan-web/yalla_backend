const { use_db } = require("../../config/db_pool")


const getallSchools = async (req,res)=>{
    const data = await use_db(`select * from schools`);
  if (!data.rows || data?.rows.length < 1 || data.rows === []) {
    res.status(401).send("an error occured or no available data found");
  } else {
    res.json(data.rows);
  }
}

module.exports = {
    getallSchools
}