import { Router } from "express";
import {userAuth} from "../middleware/auth.js";
const router = Router();

router.get("/");

export default router;