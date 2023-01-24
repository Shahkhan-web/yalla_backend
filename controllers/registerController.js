const bcrypt = require("bcrypt"); 
const { use_db } = require("../config/db_pool");


const handleNewUser = async (req, res) => {

  const { user, password, email, roles } = req.body;

  if ((!user || !password, !email))
    return res.status(400).json({ message: "please fill all fields" });

  try {
    const currentTimestamp = new Date().toISOString();
    //encrypt the password
    const hashedPwd = await bcrypt.hash(password, 10);

    const default_roles = {"guest":"3333"}
    
    let assignable_roles = {...roles , ...default_roles}
    //store the new user
    const newUser = {
      username: user,
      email: email,
      roles: JSON.stringify(assignable_roles) || JSON.stringify(default_roles),
      password: hashedPwd,
      created_on: currentTimestamp,
    };

    use_db(
      `Insert into users (username,password,email,created_on,roles) VAlues ('${newUser.username}','${newUser.password}','${newUser.email}','${newUser.created_on}','${newUser.roles}')`
    )
      .then((message) => {
        if (message.command === "INSERT") {
        
          res.json({ Success: "User added successfully" });
        } else {
          res.json({ message });
        }
      })
      .catch((err) => console.log(err));
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

module.exports = { handleNewUser };
