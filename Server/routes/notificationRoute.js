import { Router } from "express";
import { adminAuth, allAuth, userAuth } from "../middleware/auth.js";
import { getAllNotifications } from "../controller/notificationController.js";

const router = Router();

router.get("/", adminAuth, getAllNotifications);
export default router;
