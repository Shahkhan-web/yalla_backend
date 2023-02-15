const { sendmail } = require("../../config/sendMail");

const mail = async (req, res) => {
  const { subject, email, cc, html,template ,school} = req.body;

  const data = {
    subject,
    school,
    email, 
    cc,
    html,
    template
  };
  try {
    sendmail(data);
    res.json({"status":"success"})
  } catch (error) {
    res.json(error)
    return error
  }
};
const school_wish = async (req, res) => {
  const {email,name} = req.body;
  console.log('hi')

  const data = {
    name: name,
    email: "arctiguana12@gmail.com",
    school_email:email,
    subject: "New School entry - Yalla Recruitment",
    template:"school_wished"
  };
  if(!name || !email){
    res.status(401).json({err:'enter proper data'})
 }
  console.log('data',data)
  try {
    sendmail(data);
    res.json({"status":"success"})
    return
  } catch (error) {
    res.json(error)
    return error
  }
};
module.exports = {
  mail,
  school_wish
};
