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
module.exports = {
  mail,
};
