import sequelize from "../db.js";
import { Sequelize, DataTypes } from "sequelize";
const User = sequelize.define(
  "user",
  {
    // attributes
    name: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    email: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    password: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    totalPoint: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    address: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    isActive: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
    },
  },
  {
    // options
  }
);
User.sync();
export default User;
