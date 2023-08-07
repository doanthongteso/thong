import sequelize from "../db.js";
import { Sequelize, DataTypes } from "sequelize";
const Product = sequelize.define(
  "product",
  {
    // attributes
    name: {
      type: Sequelize.STRING,
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
Product.sync();
export default Product;
