import Card from "../model/Card.js";
import Gift from "../model/Gift.js";
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
    include: [{ model: ProductCode, include: Product }, { model: Card }],
    where: { userId: user_id },
    order: [["createdAt", "DESC"]],
  });
  return res.status(200).json(allHistoryPoints);
};

const getHIstoryGiftExchangeByUserId = async (req, res) => {
  const { user_id } = req.body;
  const allHistoryPoints = await HistoryPoint.findAll({
    include: [{ model: Gift }, { model: Card }],
    where: { userId: user_id, type: false },
    order: [["createdAt", "DESC"]],
  });
  return res.status(200).json(allHistoryPoints);
};
export { getAllHistoryPoints, getHIstoryPointsByUserId ,getHIstoryGiftExchangeByUserId};
