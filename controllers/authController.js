const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { use_db } = require("../config/db_pool");
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

    console.log(foundUser[0].roles, foundUser[0].name);
    if (foundUser.length === 0) {
      res.status(400).json({
        error: "User is not registered, Sign Up first",
      });
    } //Unauthorized
    else {
      bcrypt.compare(password, foundUser[0].password, (err, result) => {
        //Comparing the hashed password
        if (err) {
          res.status(500).json({
            error: "Server error",
          });
        } else if (result === true) {
          // create JWTs
          const accessToken = jwt.sign(
            {
              UserInfo: {
                username: foundUser[0].username,
                roles: foundUser[0].roles,
              },
            },
            process.env.ACCESS_TOKEN_SECRET,
            { expiresIn: "1d" }
          );
          const refreshToken = jwt.sign(
            { username: foundUser[0].username },
            process.env.REFRESH_TOKEN_SECRET,
            { expiresIn: "30d" }
          );

          use_db(
            `Update users set refreshtoken = '${refreshToken}' where email = '${email}'`
          ).then((data) => {
            console.log(data);
            res.cookie("jwt", refreshToken, {  
              httpOnly:true,
              path: "/auth",
              secure:false,
              maxAge: 24 * 60 * 60 * 1000,
              sameSite:'None'
            });
            res.json(accessToken);
          });
        } else {
          //Declaring the errors
          if (result != true) {
            res.status(400).json({
              error: "Enter correct password!",
            });
          }
        }
      });
    }
  } catch (err) {
    console.log(err);
    res.status(500).json({
      error: "Database error occurred while signing in!", //Database connection error
    });
  }
};

module.exports = { handleLogin };
