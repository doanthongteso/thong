import { Router } from "express";
import { userAuth, adminAuth } from "../middleware/auth.js";
import {
  activeUser,
  banUser,
  changePassword,
  deleteUser,
  getAllUser,
  getUserByEmail,
  updateUser,
} from "../controller/userController.js";

const router = Router();

router.get("/", adminAuth, getAllUser);
router.get("/email", userAuth, getUserByEmail);
router.put("/", userAuth, updateUser);
router.delete("/:id", userAuth, deleteUser);
router.post("/changePassword", userAuth, changePassword);
router.post("/banUser/:id", adminAuth, banUser);
router.post("/activeUser/:id", adminAuth, activeUser);

export default router;
