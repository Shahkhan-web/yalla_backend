const AWS = require("aws-sdk");
const multer = require("multer");
const multerS3 = require("multer-s3");
const { logger } = require("../middleware/logEvents");

//configuring the AWS environment
AWS.config.update({
  accessKeyId: process.env.AWS_ACCESS_KEY,
  secretAccessKey: process.env.AWS_PRIVATE_KEY,
});

var s3 = new AWS.S3();

// configure multer and multer-s3
const upload = multer({
  storage: multerS3({
    s3: s3,
    bucket: "yalla-profile-images",
    metadata: function (req, file, cb) {
      cb(null, { fieldName: file.fieldname });
    },
    key: function (req, file, cb) {
      const filename = Date.now().toString();
      cb(null, filename);
    },
    Body: function (req, file, cb) {
      const base64Data = Buffer.from(
        req.body.profile.replace(/^data:image\/\w+;base64,/, ""),
        "base64"
      );
      cb(null, base64Data);
    },
    ContentEncoding: "base64",
    ContentType: "png/jpeg/jpg",
  }),
});

// define middleware function
const uploadImage = (req, res, next) => {
  upload.single("file")(req, res, (err) => {
    if (err) {
      // handle error
      console.log(err);
      return res.status(400).json({ message: err.message });
    }
    next();
  });
};

const getObject = (key) => {
  try {
    var params = {
      Bucket: "yalla-profile-images",
      Key: key,
    };

    return s3.getObject(params).createReadStream();
  } catch (e) {
    logger(new Error(`Could not retrieve file from S3: ${e.message}`));
  }
};
const direct_upload = async (data,data_key) => {
  const base64Data = Buffer.from(
    data.replace(/^data:image\/\w+;base64,/, ""),
    "base64"
  );
  const key_id = data_key.length >= 10?data_key:Date.now().toString();
  var params = {
    Bucket: "yalla-profile-images",
    Body: base64Data,
    Key: key_id,
  };
  return new Promise((resolve, reject) => {
    if(data.length < 0){
      reject({status:404});
    }
    s3.upload(params, (err, data) => {
      if (err) {
        console.log("Error", err);
        reject({status:400,err:err});
      } else {
        console.log("Uploaded in:", data.Location);
        resolve({status:200,location:data.location,key:key_id});
      }
    });
  });
};

module.exports = {
  // uploader,
  uploadImage,
  direct_upload,
  getObject,
};
// var filePath = "./logs/reqLog.txt";

// //configuring parameters
// var params = {
//   Bucket: 'yalla-profile-images',
//   Body : fs.createReadStream(filePath),
//   Key : "profiles/"+path.basename(filePath)
// };

// s3.upload(params, function (err, data) {
//   //handle error
//   if (err) {
//     console.log("Error", err);
//   }
//   //success
//   if (data) {
//     console.log("Uploaded in:", data.Location);
//   }
// });

// const getObject = async (bucket, objectKey) =>{
//     try {
//         var params = {
//             Bucket: 'yalla-profile-images',
//             Key : "profiles/reqLog.txt"
//           };

//       const data = await s3.getObject(params).promise();

//       return data.Body.toString('utf-8');
//     } catch (e) {
//       throw new Error(`Could not retrieve file from S3: ${e.message}`)
//     }
//   }

//   // To retrieve you need to use `await getObject()` or `getObject().then()`
//   const myObject = getObject('yalla-profile-images', 'path/to/the/object.txt').then(i=>{
//     console.log(i)
//   });

// return;
