const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { use_db } = require("../../config/db_pool");
const { sendmail } = require("../../config/sendMail"); 

require("dotenv").config();

const handle_reset = async (req, res) => {
  const { email } = req.body;
  console.log(req.body);
  if (!email) {
    return res
      .status(400)
      .json({ message: "Username and password are required." });
  }

  const token = jwt.sign({ email: email }, process.env.PASSWORD_RESET_TOKEN, {
    expiresIn: "15m",
  });

  const data = {
    email: email,
    subject: "PASSWORD RESET - Yalla Recruitment",
    template: "password_reset",
    link: `http://${process.env.CLIENT_URL}/password_reset/${token}`,
  };

  sendmail(data).then((data) => {
    res.status(200).json({ success: email });
    return;
  });
};

const handle_reset_mailed = async (req, res) => {
  const { token } = await req.params;
  const {password} = await req.body
  jwt.verify(
    token,
    process.env.PASSWORD_RESET_TOKEN,
    async function (error, decodedData) {
      if (error) {
        return res.json({ error: "token is expired or invalid" });
      }
      const foundUser = await use_db(`select * from users where email = '${decodedData.email}'`)  
      if(!foundUser.rows) return res.status(401).json({err:"user not found or Invalid user"})
 
      const hashedPwd = await bcrypt.hash(password, 10);
 
      use_db(`update users set password = '${hashedPwd}' where email = '${decodedData.email}'`).then(data=>{ 
         res.json(data)
      })

    }
  );
};
module.exports = {
  handle_reset,
  handle_reset_mailed,
};
