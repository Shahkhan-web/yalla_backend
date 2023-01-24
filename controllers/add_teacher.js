const { use_db } = require("../config/db_pool");
const bcrypt = require("bcrypt");

const add_teacher = async (req, res) => {
  const {
    country,
    availability,
    experienceInMiddleEast,
    curriculum,
    englishProficiency,
    qualification,
    qualificationLicense,
    salaryExpectation,
    currentSalary,
    teachingExperience,
    username,
    email,
    password,
    teachingLevel,
    teachingSubject,
    preferTeaching,
    phoneNumber,
    gender,
    dob,
    maritalStatus,
    dependents,
    location,
    nationality,
    roles,
  } = req.body;

  //add teachers data
  const add_data = async (req, res) => {
    const data = await use_db(
      `select user_id from users where username = '${username}'`
    );
    const user_id = data.rows[0].user_id;
    try {
      use_db(`
        insert into teachers_data 
            (teacher_id,
            phone,
            gender,
            dob,
            user_id,
            curr_location,
            teaching_exp_years,
            salary_expectations,
            current_salary,
            availibility,
            marital_status,
            dependents,
            country_of_qualification,
            qualification,
            curriculem,
            license,
            age_groups,
            subjects,
            desired_location,
            english_level,
            nationality,
            gc_exp) VALUES 
            (
                ${user_id},
                '${phoneNumber}',
                '${gender}',
                '${dob}',
                ${user_id},
                '${location}',
                '${teachingExperience}',
                '${salaryExpectation}',
                '${currentSalary}',
                '${availability}',
                '${maritalStatus}',
                '${dependents}',
                '${country}',
                '${qualification}',
                '${curriculum}',
                '${qualificationLicense}',
                '${teachingLevel}',
                '${teachingSubject}',
                '${preferTeaching}',
                '${englishProficiency}',
                '${nationality}',
                '${experienceInMiddleEast}'
            );`)
        .then((message) => {
          if (message.command === "INSERT") {
            res.json({Success:"teacher added successfully"})
          } else {
            use_db(`delete from users where user_id = ${user_id}`)
            res.json({ message });
          }
        })
        .catch((err) => console.log(err));
    } catch (err) {
      res.status(500).json({ message: err.message });
    }
  };

  // add teacher as user
  const register_teacher = async (req, res) => {
    if ((!username || !password, !email))
      return res.status(400).json({ message: "please fill all fields" });

    try {
      const currentTimestamp = new Date().toISOString();
      //encrypt the password
      const hashedPwd = await bcrypt.hash(password, 10);

      const default_roles = { guest: "3333", teacher: "2222" };

      let assignable_roles = { ...roles, ...default_roles };
      //store the new user
      const newUser = {
        username: username,
        email: email,
        roles:
          JSON.stringify(assignable_roles) || JSON.stringify(default_roles),
        password: hashedPwd,
        created_on: currentTimestamp,
      };

      use_db(
        `Insert into users (username,password,email,created_on,roles) VAlues ('${newUser.username}','${newUser.password}','${newUser.email}','${newUser.created_on}','${newUser.roles}')`
      )
        .then((message) => {
          if (message.command === "INSERT") {
            add_data(req, res);
          } else {
            res.json({ message });
          }
        })
        .catch((err) => console.log(err));
    } catch (err) {
      res.status(500).json({ message: err.message });
    }
  };

  register_teacher(req, res);
};

module.exports = { add_teacher };
