const express = require("express");
const app = express();
const path = require("path");
const cors = require("cors");
const dotenv = require("dotenv");

const bodyParser = require("body-parser");
const corsOptions = require("./config/corsOptions");
const { logger } = require("./middleware/logEvents");
const errorHandler = require("./middleware/errorHandler");
const verifyJWT = require("./middleware/verifyJWT");
const cookieParser = require("cookie-parser");
const credentials = require("./middleware/credentials");

const { uploader, getObject } = require("./config/s3manager");

const PORT = process.env.PORT || 8000;

// create application/json parser
var jsonParser = bodyParser.json({ limit: "50mb" });

// create application/x-www-form-urlencoded parser
var urlencodedParser = bodyParser.urlencoded({
  limit: "5mb",
  parameterLimit: 100000,
  extended: false,
});

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

app.use(jsonParser);
app.use(urlencodedParser);
//middleware for cookies
app.use(cookieParser());

//serve static files
app.use("/", express.static(path.join(__dirname, "/public")));

// rout es
app.use("/", require("./routes/root"));

app.get("/image/:key", function (req, res, next) {
  const key = req.params.key;
  const readStream = getObject(key);
  readStream.pipe(res);
});

app.use("/teacher/update", require("./routes/api/teachers/update")); 
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
app.use("/forgot_password", require("./routes/auth/password_reset"));

//contact queries
app.use("/send_query", require("./routes/api/others/send_query"));
app.use("/add_testimonials", require("./routes/api/others/testimonials"));

app.use(verifyJWT);

app.use("/get_query", require("./routes/api/others/getqueries"));

app.use("/mail", require("./routes/api/others/mail"));

//teachers
app.use("/teacher/list_teacher", require("./routes/api/teachers/list_teacher"));
// TODO Enable later
// app.use("/teacher/update/", require("./routes/api/teachers/update"));
app.use("/teacher/delete", require("./routes/api/teachers/delete"));

//schools
app.use("/schools/list_schools", require("./routes/api/schools/filterSchools"));
app.use("/schools/delete", require("./routes/api/schools/delete"));

//admin
app.use("/admin/list_admins", require("./routes/api/admin/filterAdmins"));
app.use("/admin/delete", require("./routes/api/admin/delete"));

//other
app.use("/cv_editor", require("./routes/api/others/cv_editor"));

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
