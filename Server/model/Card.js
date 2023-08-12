import sequelize from "../db.js";
import { Sequelize, DataTypes } from "sequelize";
const Card = sequelize.define(
  "card",
  {
    // attributes
    code: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    // options
  }
);
Card.sync();
export default Card;
