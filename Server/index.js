import express from "express";
import bodyParser from "body-parser";
import cookieParser from "cookie-parser";
import dotenv from "dotenv";
import cors from "cors";

import userRoute from "./routes/userRoute.js";
import authRoute from "./routes/authRoute.js";
import productRoute from "./routes/productRoute.js";
import productCodeRoute from "./routes/productCodeRoute.js";
import bannerRoute from "./routes/bannerRoute.js";
import giftRoute from "./routes/giftRoute.js";
const app = express();

dotenv.config();
const port = process.env.PORT || 3000;

app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

app.use(cors());
app.use(cookieParser());

app.use("/", authRoute);
app.use("/api/user", userRoute);
app.use("/api/product", productRoute);
app.use("/api/productCode", productCodeRoute);
app.use("/api/banner", bannerRoute);
app.use("/api/gift", giftRoute);

app.listen(port, () => {
  console.log(`Server listening on the port  ${port}`);
});
