import { v2 as cloudinary } from "cloudinary";
import { CloudinaryStorage } from "multer-storage-cloudinary";
import multer from "multer";

cloudinary.config({
  cloud_name: "devkynlcz",
  api_key: "775294743967723",
  api_secret: "q4-3GVAH-tppPn3hdn3YtMQcfhM",
});
const upload = multer({
  storage: new CloudinaryStorage({
    cloudinary: cloudinary,
    params: {
      folder: "Loyalty",
    },
  }),
});

export {upload};
