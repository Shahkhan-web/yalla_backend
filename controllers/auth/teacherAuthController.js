const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { use_db } = require("../../config/db_pool");
require("dotenv").config();

const handleLogin = async (req, res) => {
  const { email, password } = req.body;
  if (!email || !password)
    return res
      .status(400)
      .json({ message: "Username and password are required." });
  try {
    const data = await use_db(`SELECT * FROM users WHERE email = '${email}'`);
    const foundUser = data.rows;
    const role = Object.values(foundUser[0].roles);
    if (!role.includes("2222")) {
      return res.status(401).send("Teachers access only");
    }
    if (foundUser.length === 0) {
      return res.status(400).json({
        error: "User is not registered, Sign Up first",
      });
    } //Unauthorized
    else {
      bcrypt.compare(password, foundUser[0].password, (err, result) => {
        //Comparing the hashed password
        if (err) {
          return res.status(500).json({
            error: "Server error",
          });
        } else if (result === true) {
          // create JWTs
          const roles = Object.values(foundUser[0].roles);
          const accessToken = jwt.sign(
            {
              UserInfo: {
                username: foundUser[0].username,
                roles: roles,
                userId: foundUser[0].user_id,
              },
            },
            process.env.ACCESS_TOKEN_SECRET,
            { expiresIn: "1d" }
          );
          const refreshToken = jwt.sign(
            { username: foundUser[0].username },
            process.env.REFRESH_TOKEN_SECRET,
            { expiresIn: "31d" }
          );

          use_db(
            `Update users set refreshtoken = '${refreshToken}' where email = '${email}'`
          ).then((data) => {
            console.log(data);
            res.cookie("jwt", refreshToken, {
              maxAge: 24 * 60 * 60 * 1000, 
              secure: false,
              httpOnly: true,
            });
            return res.json(accessToken);
          });
        } else {
          //Declaring the errors
          if (result != true) {
            return res.status(400).json({
              error: "Enter correct password!",
            });
          }
        }
      });
    }
  } catch (err) {
    console.log(err);
    return res.status(500).json({
      error: "Database error occurred while signing in!", //Database connection error
    });
  }
};

module.exports = { handleLogin };
