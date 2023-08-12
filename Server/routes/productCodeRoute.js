import { Router } from "express";
import {userAuth} from "../middleware/auth.js";import {
  addPoint,
  getAllProductCode,
} from "../controller/productCodeController.js";

const router = Router();

router.get("/", getAllProductCode);
router.post("/addPoint", userAuth, addPoint);
export default router;