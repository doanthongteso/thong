import { Router } from "express";
import {userAuth} from "../middleware/auth.js";
import {
  getAllGift,
  getGiftByCategory,
  giftExchange,
} from "../controller/giftController.js";

const router = Router();

router.get("/", userAuth, getAllGift);
router.get("/:category", userAuth, getGiftByCategory);
router.post("/exchange", userAuth, giftExchange);
export default router;