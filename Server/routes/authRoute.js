import { Router } from "express";
import { login, register, verifyOtp } from "../controller/authController.js";

const router = Router();

router.post("/register", register);
router.post("/login", login);
router.post("/verify", verifyOtp);
export default router;
