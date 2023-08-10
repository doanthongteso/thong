import { Router } from "express";
import auth from "../middleware/auth.js";

import {
  getAllGift,
  getGiftByCategory,
  giftExchange,
} from "../controller/giftController.js";

const router = Router();

router.get("/", auth, getAllGift);
router.get("/:category", auth, getGiftByCategory);
router.post("/exchange", auth, giftExchange);
export default router;
