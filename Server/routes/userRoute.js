import { Router } from "express";
import auth from "../middleware/auth.js";
import {
  deleteUser,
  getAllUser,
  getUserByEmail,
  updateUser,
} from "../controller/userController.js";

const router = Router();

router.get("/", auth, getAllUser);
router.get("/email", auth, getUserByEmail);
router.put("/:id", auth, updateUser);
router.delete("/:id", auth, deleteUser);
export default router;
