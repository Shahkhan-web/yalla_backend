const bcrypt = require("bcrypt");
const { use_db } = require("../../config/db_pool");

const handleNewAdmin = async (req, res) => {
  const { username, password, email, roles } = req.body;

  if ((!username || !password, !email))
    return res.status(400).json({ message: "please fill all fields" });

  try {
    const currentTimestamp = new Date().toISOString();
    //encrypt the password
    const hashedPwd = await bcrypt.hash(password, 10);

    const default_roles = { guest: "3333", admin: "0000" };

    let assignable_roles = { ...roles, ...default_roles };
    //store the new user
    const newUser = {
      username: username,
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
          use_db(
            `select user_id from users where username = '${newUser.username}'`
          ).then((data) => {
            const id = data.rows[0].user_id;
            console.log(id);
            use_db(
                    `insert into admins (name,admin_id,email) Values ('${newUser.username}',${id},'${newUser.email}')`
            );
          });

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

module.exports = { handleNewAdmin };
