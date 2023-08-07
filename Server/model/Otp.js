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
    expireTime: {
      type: DataTypes.TIME,
      allowNull: false,
    },
  },
  {
    // options
  }
);
OTP.sync();
export default OTP;
