import sequelize from "../db.js";
import { Sequelize, DataTypes } from "sequelize";

const Notification = sequelize.define(
  "notification",
  {
    // attributes
    title: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    description: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    // options
  }
);
Notification.sync();

export default Notification;
