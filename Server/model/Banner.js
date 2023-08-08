import sequelize from "../db.js";
import { Sequelize, DataTypes } from "sequelize";
const Banner = sequelize.define(
  "banner",
  {
    // attributes
    imgUrl: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    // options
  }
);
Banner.sync();
export default Banner;
