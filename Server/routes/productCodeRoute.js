import { Router } from "express";
import auth from "../middleware/auth.js";
import {
  addPoint,
  getAllProductCode,
} from "../controller/productCodeController.js";

const router = Router();

router.get("/", getAllProductCode);
router.post("/addPoint", auth, addPoint);
export default router;