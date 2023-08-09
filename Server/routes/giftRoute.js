import { Router } from "express";
import { getAllGift, getGiftByCategory, giftExchange } from "../controller/giftController.js";

const router = Router();

router.get("/", getAllGift);
router.get("/:category", getGiftByCategory);
router.post("/exchange", giftExchange)
export default router;
