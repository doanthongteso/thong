import { Router } from "express";
import {userAuth} from "../middleware/auth.js";
import { getAllProducts } from "../controller/productController.js";

const router = Router();

router.get("/", getAllProducts);
export default router;
