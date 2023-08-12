import User from "../model/User.js";
import OTP from "../model/Otp.js";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { generateOTP, sendNewPassword, sendOTP } from "../utils/mail.js";
import { generateRandomString } from "../utils/generateNumber.js";
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
      role: "user",
      phone: null,
    };
    const otp = generateOTP();
    await OTP.create({
      otp: otp,
      email: email.toLowerCase(),
    });
    const user = await User.create(newUser);

    sendOTP(email, otp);
    // return new user
    res.status(201).json(user);
  } catch (err) {
    console.log(err);
  }
};

const verifyOtp = async (req, res) => {
  const { email, otp } = req.body;
  try {
    const checkOtp = await OTP.findOne({ where: { email: email, otp: otp } });
    if (!checkOtp) {
      return res.status(409).send("Wrong OTP");
    }
    console.log(checkOtp);
    const user = await User.update(
      { isActive: true },
      { where: { email: email } }
    );
    await OTP.destroy({ where: { email: email } });
    // return new user
    res.status(200).json("verified");
  } catch (err) {
    console.log(err);
  }
};

const forgotPassword = async (req, res) => {
  try {
    // Get user input
    const { email } = req.body;
    // Validate user input
    if (!email) {
      res.status(400).send("All input is required");
    }

    // check if user already exist
    // Validate if user exist in our database
    const user = await User.findOne({ where: { email: email } });

    if (!user) {
      return res.status(404).send("Not found user");
    }

    //Encrypt user password
    const newPassword = generateRandomString(6);
    const encryptedPassword = await bcrypt.hash(newPassword, 10);
    // Create user in our database
    (await user.update({ password: encryptedPassword })).save();
    sendNewPassword(email, newPassword);
    // return new user
    res.status(201).json({ message: "Success", newPassword: newPassword });
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
    const user = await User.findOne({ where: { email: email, role: "user" } });
    if (user && (await bcrypt.compare(password, user.password))) {
      // Create token
      const token = jwt.sign(
        { user_id: user.id, email, role: user.role },
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
      return res.status(200).json({ message: "Success", response: response });
    }
    res.status(400).json({ message: "Invalid Email or Password" });
  } catch (err) {
    console.log(err);
  }
};

const adminLogin = async (req, res) => {
  try {
    // Get user input
    const { email, password } = req.body;
    // Validate user input
    if (!(email && password)) {
      return res.status(400).send("All input is required");
    }
    // Validate if user exist in our database
    const user = await User.findOne({ where: { email: email, role: "admin" } });
    if (user && (await bcrypt.compare(password, user.password))) {
      // Create token
      const token = jwt.sign(
        { user_id: user.id, email, role: user.role },
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
export { register, login, verifyOtp, adminLogin, forgotPassword };
