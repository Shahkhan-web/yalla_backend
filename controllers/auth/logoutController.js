const {use_db} = require('../../config/db_pool')
 

const handleLogout = async (req, res) => {
    // On client, also delete the accessToken

    const cookies = req.cookies;
    if (!cookies?.jwt) return res.sendStatus(204); //No content
    const refreshToken = cookies.jwt;

    // Is refreshToken in db?
    
    const foundUser = await use_db(`select * from users where refreshToken = '${refreshToken}'`);
    if (!foundUser) {
        res.clearCookie('jwt', { httpOnly: true, sameSite: 'None', secure: false });
        return res.sendStatus(204);
    }

    // Delete refreshToken in db
   await use_db(`update users set refreshToken = '' where refreshToken = '${refreshToken}'`)

    res.clearCookie('jwt', { httpOnly: true, sameSite: 'None', secure: true });
    res.sendStatus(204);
}

module.exports = { handleLogout }