import Product from "../model/Product.js";
import ProductCode from "../model/ProductCode.js";
import User from "../model/User.js";

const getAllProductCode = async (req, res) => {
  try {
    const product = await ProductCode.findAll({ include: Product });
    res.status(200).json({ product });
  } catch (error) {
    console.error(error);
  }
};

const addPoint = async (req, res) => {
  try {
    const { email, productCode } = req.body;
    const product = await ProductCode.findOne({
      include: Product,
      where: { code: productCode },
    });
    if (!product) {
      return res.status(404).json({ message: "Not found" });
    }
    if (!product.status) {
      return res.status(409).json({ message: "Used" });
    }
    const user = await User.findOne({ where: { email: email } });
    (
      await user.update({ totalPoint: user.totalPoint + product.product.point })
    ).save();
    (await product.update({ status: false })).save();
    res.status(200).json({ user, product });
  } catch (error) {
    console.error(error);
  }
};
export { getAllProductCode, addPoint };
