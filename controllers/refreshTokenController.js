const {use_db} = require('../config/db_pool')
const jwt = require('jsonwebtoken');
require('dotenv').config();

const handleRefreshToken = async (req, res) => {
    const cookies = req.cookies;
    if (!cookies?.jwt) return res.status(401).send(req.cookies);
    const refreshToken = cookies.jwt; 
    const data = await use_db(`SELECT * FROM users WHERE refreshtoken = '${refreshToken}'`);
    const foundUser = data.rows;
    console.log(foundUser[0].username)
    if (!foundUser) return res.json({403:"not error"}); //Forbidden 
    // evaluate jwt 
    jwt.verify(
        refreshToken,
        process.env.REFRESH_TOKEN_SECRET,
        (err, decoded) => {
            if (err || foundUser[0].username !== decoded.username) return res.sendStatus(403);
            const roles = Object.values(foundUser[0].roles);
            const accessToken = jwt.sign(
                {
                    "UserInfo": {
                        "username": decoded.username,
                        "roles": roles
                    }
                },
                process.env.ACCESS_TOKEN_SECRET,
                { expiresIn: '30 days' }
            );
            res.json({ accessToken})
        }
    );
}

module.exports = { handleRefreshToken }