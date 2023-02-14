const {use_db} = require('../../config/db_pool')

const getstats = async (req,res)=>{

   const teachers = await use_db('SELECT count(*) from teachers_data')
   const favteachers = await use_db('SELECT count(*) from teachers_data where favourite = true')
   const schools = await use_db('SELECT count(*) from schools')
   const admin = await use_db('SELECT count(*) from admins')

   const teachercount =  teachers.rows[0].count
   const favteachercount =  favteachers.rows[0].count
   const schoolscount =  schools.rows[0].count
   const admincount =  admin.rows[0].count
   res.json({teachers:teachercount,fav_teachers:favteachercount,schools:schoolscount,admins:admincount})
}
module.exports= {
   getstats
}