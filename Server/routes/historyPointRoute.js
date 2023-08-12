import { Router } from "express";
import {userAuth} from "../middleware/auth.js";import {
  getAllHistoryPoints,
  getHIstoryGiftExchangeByUserId,
  getHIstoryPointsByUserId,
} from "../controller/historyPointController.js";

const router = Router();

router.get("/", getAllHistoryPoints);
router.get("/userHistory", userAuth, getHIstoryPointsByUserId);
router.get("/userGiftHistory", userAuth, getHIstoryGiftExchangeByUserId);

export default router;