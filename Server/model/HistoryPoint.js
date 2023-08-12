import sequelize from "../db.js";
import { Sequelize, DataTypes } from "sequelize";
import ProductCode from "./ProductCode.js";
import User from "./User.js";
import Gift from "./Gift.js";
import Card from "./Card.js";

const HistoryPoint = sequelize.define(
  "history_point",
  {
    // attributes
    type: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
    },
    point: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    // options
  }
);
HistoryPoint.belongsTo(ProductCode);
HistoryPoint.belongsTo(User);
HistoryPoint.belongsTo(Gift);
HistoryPoint.belongsTo(Card);
HistoryPoint.sync();
export default HistoryPoint;
