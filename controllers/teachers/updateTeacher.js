const { use_db } = require("../../config/db_pool");

const update = async (req, res) => {
  let req_id = await req.params.id;
  let data = await req.body;
  console.log(data)
  try {
    updateTeachers(data, req_id);
    res.status(200).json({"status":200});
    return
  } catch (errr) {}
  res.status(401).send(err);
  return
};

const togglefav = async (req,res)=>{
    req_id = await req.params.id
    await use_db(`update teachers_data set favourite = NOT favourite where user_id = ${req_id}`)
    res.status(200).json({"status":200})
    return
}
const updateTeachers = async (teacherData, id) => {
    // Build the SET clause for the SQL query
    let setClause = '';
    for (const [key, value] of Object.entries(teacherData)) {
      if (Array.isArray(value) && value.length === 0) {
        continue;
      }
      if (typeof value === 'string' && value.length === 0) {
        continue;
      }
      if (typeof value === 'boolean') {
        setClause += `${key}=${value},`;
      } else {
        setClause += `${key}='${value}',`;
      }
    }
    setClause = setClause.slice(0, -1);
  
    // Run the update query
    const query = `UPDATE teachers_data SET ${setClause} WHERE user_id=${id}`;
    await use_db(query); 
  };
  
module.exports = {
  update,
  togglefav
};
