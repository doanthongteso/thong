import HistoryPoint from "../model/HistoryPoint.js";
import Product from "../model/Product.js";
import ProductCode from "../model/ProductCode.js";

const getAllHistoryPoints = async (req, res) => {
  const allHistoryPoints = await HistoryPoint.findAll();
  return res.status(200).json(allHistoryPoints);
};

const getHIstoryPointsByUserId = async (req, res) => {
  const { user_id } = req.body;
  const allHistoryPoints = await HistoryPoint.findAll({
    include: [{ model: ProductCode, include: Product }],
    where: { userId: user_id },
  });
  return res.status(200).json(allHistoryPoints);
};

export { getAllHistoryPoints, getHIstoryPointsByUserId };