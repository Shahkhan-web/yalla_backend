const express = require("express");
const app = express();
const path = require("path");
const cors = require("cors");
const dotenv = require("dotenv");

const corsOptions = require("./config/corsOptions");
const { logger } = require("./middleware/logEvents");
const errorHandler = require("./middleware/errorHandler");
const verifyJWT = require("./middleware/verifyJWT");
const cookieParser = require("cookie-parser");
const credentials = require("./middleware/credentials");

const sendMail = require("./config/sendMail");
const PORT = process.env.PORT || 8000;

// dot env files
dotenv.config();

app.set("trust proxy", 1);
// custom middleware logger
app.use(logger);

// Handle options credentials check - before CORS!
// and fetch cookies credentials requirement
app.use(credentials);

// Cross Origin Resource Sharing
app.use(cors(corsOptions));

// built-in middleware to handle urlencoded form data
app.use(express.urlencoded({ extended: false }));

// built-in middleware for json
app.use(express.json());

//middleware for cookies
app.use(cookieParser());

//serve static files
app.use("/", express.static(path.join(__dirname, "/public")));

// rout es
app.use("/", require("./routes/root"));

//register admin/school
app.use("/register", require("./routes/register"));
//login user
app.use("/auth", require("./routes/auth/auth"));

app.use("/refresh", require("./routes/auth/refresh"));
app.use("/logout", require("./routes/auth/logout"));
app.use(
  "/teacher/options",
  require("./routes/api/teachers/list_teacher_options")
);

//stats 
app.use("/stats", require("./routes/api/others/stats"));

//password reset
app.use("/forgot_password",require("./routes/auth/password_reset"))

//contact queries
app.use("/send_query",require('./routes/api/others/send_query'))
app.use("/get_query",require('./routes/api/others/getqueries'))

app.use(verifyJWT);

app.use("/mail", require("./routes/api/others/mail"));

//teachers
app.use("/teacher/list_teacher", require("./routes/api/teachers/list_teacher"));
app.use("/teacher/update/", require("./routes/api/teachers/update"));
app.use("/teacher/delete/", require("./routes/api/teachers/delete"));

//schools
app.use("/schools/list_schools", require("./routes/api/schools/filterSchools"));
app.use("/schools/delete", require("./routes/api/schools/delete"));

//admin
app.use("/admin/list_admins", require("./routes/api/admin/filterAdmins"));
app.use("/admin/delete", require("./routes/api/admin/delete"));

//other
app.use("/cv_editor",require('./routes/api/others/cv_editor'))

app.all("*", (req, res) => {
  res.status(404);
  if (req.accepts("html")) {
    res.sendFile(path.join(__dirname, "views", "404.html"));
  } else if (req.accepts("json")) {
    res.json({ error: "404 Not Found" });
  } else {
    res.type("txt").send("404 Not Found");
  }
});

app.use(errorHandler);

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
