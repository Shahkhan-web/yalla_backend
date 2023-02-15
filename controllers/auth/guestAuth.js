const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { use_db } = require("../../config/db_pool");
require("dotenv").config();

const handleLogin = async (req, res) => {
  // create JWTs
  const accessToken = jwt.sign(
    {
      UserInfo: {
        username: "guest",
        roles: ["3333", "1111"],
        userId: 00,
      },
    },
    process.env.ACCESS_TOKEN_SECRET,
    { expiresIn: "5m" }
  ); 
  
  return res.json(accessToken);
};

module.exports = { handleLogin };
