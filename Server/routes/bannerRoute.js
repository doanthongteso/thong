import { Router } from "express";
import auth from "../middleware/auth.js";
import { getBanners, uploadBanner } from "../controller/bannerController.js";
import { upload } from "../config/cloudinary.js";

const router = Router();

router.get("/getBanner", getBanners);
router.post("/uploadImage", upload.single("image"), uploadBanner);

export default router;
