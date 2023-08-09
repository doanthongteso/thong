import Product from "../model/Product.js";
import ProductCode from "../model/ProductCode.js";

const getAllProducts = async (req, res) => {
  try {
    const product = await Product.findAll({ include: ProductCode });
    res.status(200).json({ product });
  } catch (error) {
    console.error(error);
  }
};

export { getAllProducts };
