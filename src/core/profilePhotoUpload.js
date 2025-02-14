import { profilePhotouploadDir } from '../config-sample';
import multer from 'multer';
import fs from 'fs';
import bodyParser from 'body-parser';
import sharp from 'sharp';
import crypto from 'crypto';
var storage = multer.diskStorage({
  destination: profilePhotouploadDir,
  filename: function (req, file, cb) {
    crypto.pseudoRandomBytes(16, function (err, raw) {
      if (err) return cb(err);
      let ext;
      switch (file.mimetype) {
        case 'image/jpeg':
          ext = '.jpeg';
          break;
        case 'image/png':
          ext = '.png';
          break;
        case 'image/svg+xml':
          ext = '.svg';
          break;
      }
      cb(null, raw.toString('hex') + ext);
    });
  },
});
var upload = multer({ storage: storage });
function removeFiles(fileName, filePath) {
  if (fs.existsSync(filePath + fileName)) {
    // Original
    fs.unlink(filePath + fileName, err => {
      if (err) throw err;
    });
  }
  if (fs.existsSync(filePath + 'small_' + fileName)) {
    // small
    fs.unlink(filePath + 'small_' + fileName, err => {
      if (err) throw err;
    });
  }
  if (fs.existsSync(filePath + 'medium_' + fileName)) {
    // medium
    fs.unlink(filePath + 'medium_' + fileName, err => {
      if (err) throw err;
    });
  }
}
const profilePhotoUpload = app => {
  app.use(bodyParser.urlencoded({ extended: true }));
  app.use(bodyParser.json());
  app.post(
    '/uploadProfilePhoto',
    function (req, res, next) {
      if (!req.user) {
        res.send(403);
      } else {
        next();
      }
    },
    upload.single('file'),
    async (req, res, next) => {
      let file = req.file;
      // small - 100 * 100
      await new Promise((resolve, reject) => {
        sharp(file.path)
          .rotate()
          .resize(100, 100)
          // .resize(100, 100, { fit: sharp.fit.contain })
          //.crop(sharp.strategy.entropy)
          .toFile(
            profilePhotouploadDir + 'small_' + file.filename,
            function (err, file) {
              if (file) {
                resolve(file);
              } else {
                reject(err);
              }
              console.log('Error from resizing files', err);
            },
          );
      });

      // medium - 255 * 255
      await new Promise((resolve, reject) => {
        sharp(file.path)
          .rotate()
          .resize(255, 255)
          //.crop(sharp.strategy.entropy)
          .toFile(
            profilePhotouploadDir + 'medium_' + file.filename,
            function (err, file) {
              if (file) {
                resolve(file);
              } else {
                reject(error);
              }
              console.log('Error from resizing files', err);
            },
          );
      });
      res.send({ status: 'SuccessFully uploaded!', file });
    },
  );
  app.post(
    '/deleteProfilePicture',
    function (req, res, next) {
      if (!req.user) {
        res.send(403);
      } else {
        next();
      }
    },
    async (req, res) => {
      let filePath = profilePhotouploadDir;
      let fileName = req.body.fileName;
      await removeFiles(fileName, filePath);
      res.send({ status: 'Got your file to remove!' });
    },
  );
};
export default profilePhotoUpload;
