import User from "../model/User.js";
import OTP from "../model/Otp.js";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { generateOTP, sendOTP } from "../utils/mail.js";
const register = async (req, res) => {
  try {
    // Get user input
    const { name, email, password } = req.body;
    // Validate user input
    if (!(email && password && name)) {
      res.status(400).send("All input is required");
    }

    // check if user already exist
    // Validate if user exist in our database
    const oldUser = await User.findOne({ where: { email: email } });

    if (oldUser) {
      return res.status(409).send("User Already Exist. Please Login");
    }

    //Encrypt user password

    const encryptedPassword = await bcrypt.hash(password, 10);
    // Create user in our database
    const newUser = {
      name,
      email: email.toLowerCase(), // sanitize: convert email to lowercase
      password: encryptedPassword,
      isActive: false,
      totalPoint: 0,
      address: "default",
    };
    const otp = generateOTP();
    //await OTP.create({ otp: otp, expireTime: new Date().toISOString().slice(0, -1)});
    const user = await User.create(newUser);

    sendOTP("nguyendoanthe0610@gmail.com", otp);
    // return new user
    res.status(201).json(user);
  } catch (err) {
    console.log(err);
  }
};

const login = async (req, res) => {
  try {
    // Get user input
    const { email, password } = req.body;
    // Validate user input
    if (!(email && password)) {
      return res.status(400).send("All input is required");
    }
    // Validate if user exist in our database
    const user = await User.findOne({ where: { email: email } });
    if (user && (await bcrypt.compare(password, user.password))) {
      // Create token
      const token = jwt.sign(
        { user_id: user.id, email },
        process.env.SECRET_KEY,
        {
          expiresIn: "2h",
        }
      );

      // response user token
      const response = {
        userId: user.id,
        email: email,
        token: token,
      };
      // user
      res.cookie("token", token);
      return res.status(200).json(response);
    }
    res.status(400).send("Invalid Email or Password");
  } catch (err) {
    console.log(err);
  }
};
export { register, login };
