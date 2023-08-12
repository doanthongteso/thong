import { Router } from "express";
import {userAuth} from "../middleware/auth.js";import { getAllNotifications } from "../controller/notificationController.js";

const router = Router();

router.get("/", userAuth, getAllNotifications);
export default router;

