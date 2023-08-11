import { Router } from "express";
import auth from "../middleware/auth.js";
import {
  getAllHistoryPoints,
  getHIstoryPointsByUserId,
} from "../controller/historyPointController.js";

const router = Router();

router.get("/", getAllHistoryPoints);
router.get("/userHistory", auth, getHIstoryPointsByUserId);
export default router;