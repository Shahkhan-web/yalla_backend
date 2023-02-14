var nodemailer = require("nodemailer");
const hbs = require("nodemailer-express-handlebars");

var transporter = nodemailer.createTransport({
  host: "smtp.gmail.com",
  port: 465,
  secure: true,
  auth: {
    user: "arctiguana12@gmail.com",
    pass: "kwddewykndzjkkdy",
  },
});

transporter.use(
  "compile",
  hbs({
    viewEngine: {
      defaultLayout: false,
    },
    viewPath: "./public/mail/",
  })
);

async function sendmail(data) {
  console.log(data)
  const mailOptions = {
    from: "arctiguana12@gmail.com", // sender address
    to: data.email, // list of receivers
    cc: data?.cc,
    subject: data.subject, // Subject line
    template: data?.template, // plain text body
    html:data?.html,
    context: {
      name: data?.name,
      email: data?.email,
      message: data?.message,
      link:data?.link,
      school:data?.school
    },
  };

  transporter.sendMail(mailOptions, function (err, info) {
    if (err) {
      console.log("err", err);
      return err;
    } else {
      console.log("info", info);
      return info;
    }
  });
}

module.exports = {
  sendmail,
};
