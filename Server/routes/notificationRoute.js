import { Router } from "express";
import auth from "../middleware/auth.js";
import { getAllNotifications } from "../controller/notificationController.js";

const router = Router();

router.get("/", auth, getAllNotifications);
export default router;

