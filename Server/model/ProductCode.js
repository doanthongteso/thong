import sequelize from "../db.js";
import { Sequelize, DataTypes } from "sequelize";
import Product from "./Product.js";
const ProductCode = sequelize.define(
  "product_code",
  {
    // attributes
    status: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
    },
    code: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    // options
  }
);
// ProductCode.belongsTo(Product);
//ProductCode.sync();
export default ProductCode;
