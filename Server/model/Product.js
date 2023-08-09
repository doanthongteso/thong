import sequelize from "../db.js";
import { Sequelize, DataTypes } from "sequelize";
import ProductCode from "./ProductCode.js";
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
Product.hasMany(ProductCode);
ProductCode.belongsTo(Product);
Product.sync();
ProductCode.sync();
export default Product;
