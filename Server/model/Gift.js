import sequelize from "../db.js";
import { Sequelize, DataTypes } from "sequelize";
const Gift = sequelize.define(
  "gift",
  {
    // attributes
    name: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    totalCount: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    description: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    point: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    category: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    vendor: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    imgUrl: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    // options
  }
);
Gift.sync();
export default Gift;
