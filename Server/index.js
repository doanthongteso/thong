import express from "express";
import bodyParser from "body-parser";
import cookieParser from "cookie-parser";
import dotenv from 'dotenv'
import cors from 'cors';

import userRoute from "./routes/userRoute.js";
import authRoute from "./routes/authRoute.js";
import productRoute from "./routes/productRoute.js";
const app = express();

dotenv.config()
const port = process.env.PORT || 3000;

app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

app.use(cors());
app.use(cookieParser());

app.use("/api/user", userRoute);
app.use("/api/product", productRoute);
app.use("/", authRoute);
app.listen(port, () => {
  console.log(`Server listening on the port  ${port}`);
});
