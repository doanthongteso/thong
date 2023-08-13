import { Router } from "express";
import { adminAuth, allAuth, userAuth } from "../middleware/auth.js";
import { createNotification, deleteNotification, getAllNotifications, updateNotification } from "../controller/notificationController.js";

const router = Router();

router.get("/", allAuth, getAllNotifications);
router.post("/create", adminAuth, createNotification);
router.post("/update/:id", adminAuth, updateNotification);
router.delete("/delete/:id", adminAuth, deleteNotification);
export default router;
