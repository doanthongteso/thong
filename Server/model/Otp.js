import sequelize from "../db.js";
import { Sequelize, DataTypes } from "sequelize";
const OTP = sequelize.define(
  "otp",
  {
    // attributes
    otp: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    // options
  }
);
OTP.sync();
export default OTP;
