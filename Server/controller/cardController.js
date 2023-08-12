import HistoryPoint from "../model/HistoryPoint.js";
import Card from "../model/Card.js";

const getAllHistoryPoints = async (req, res) => {
  const allCards = await Card.findAll();
  return res.status(200).json(allCards);
};
