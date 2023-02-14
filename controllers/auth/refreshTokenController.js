const { use_db } = require("../../config/db_pool");
const jwt = require("jsonwebtoken");
require("dotenv").config();

const handleRefreshToken = async (req, res) => {
  const cookies = req.cookies;
  if (!cookies?.jwt) return res.status(401).send(req.cookies);
  const refreshToken = cookies.jwt;
  const data = await use_db(
    `SELECT * FROM users WHERE refreshtoken = '${refreshToken}'`
  );
  const foundUser = data.rows;
  if (!foundUser || !foundUser.length) return res.json({ 403: "not error" }); //Forbidden
  console.log(foundUser[0].username);
  // evaluate jwt
  jwt.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET, (err, decoded) => {
    if (err || foundUser[0].username !== decoded.username)
      return res.sendStatus(403);
    const roles = Object.values(foundUser[0].roles);
    const accessToken = jwt.sign(
      {
        UserInfo: {
          username: decoded.username,
          roles: roles,
          userId: foundUser[0].user_id,
        },
      },
      process.env.ACCESS_TOKEN_SECRET,
      { expiresIn: "1d" }
    );
    return res.json(accessToken);

  });
};

module.exports = { handleRefreshToken };
