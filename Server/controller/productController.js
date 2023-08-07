import Product from "../model/product.js";

const getAllProducts = async (req, res) => {
  try {
    const product = await Product.findAll();
    res.status(200).json({ product });
  } catch (error) {
    console.error(error);
  }
};

export { getAllProducts };
