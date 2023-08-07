import { Router } from "express";
import auth from "../middleware/auth.js";
import { getAllProducts } from "../controller/productController.js";

const router = Router();

router.get("/", auth, getAllProducts);
export default router;
