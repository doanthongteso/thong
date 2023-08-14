import { Router } from "express";
import { adminAuth, allAuth, userAuth } from "../middleware/auth.js";
import {
  createGift,
  deleteGift,
  getAllGift,
  getGiftByCategory,
  giftExchange,
  updateGift,
} from "../controller/giftController.js";

const router = Router();

router.get("/", allAuth, getAllGift);
router.get("/:category", userAuth, getGiftByCategory);
router.post("/exchange", userAuth, giftExchange);

router.post("/create", adminAuth, createGift);
router.post("/update/:id", adminAuth, updateGift);
router.delete("/delete/:id", adminAuth, deleteGift);
export default router;
