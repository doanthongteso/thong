import { Router } from "express";
import {
  adminLogin,
  forgotPassword,
  login,
  register,
  verifyOtp,
} from "../controller/authController.js";

const router = Router();

router.post("/register", register);
router.post("/login", login);
router.post("/admin-login", adminLogin);
router.post("/forgotPassword", forgotPassword);
router.post("/verify", verifyOtp);
export default router;
