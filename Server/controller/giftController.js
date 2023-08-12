import Gift from "../model/Gift.js";
import User from "../model/User.js";
import HistoryPoint from "../model/HistoryPoint.js";
import { generateCardCode } from "../utils/generateNumber.js";
import Card from "../model/Card.js";
const getAllGift = async (req, res) => {
  try {
    const gifts = await Gift.findAll();
    return res.status(200).json({ gifts });
  } catch (error) {
    console.log(error);
  }
};

const getGiftByCategory = async (req, res) => {
  try {
    const gifts = await Gift.findAll({
      where: { category: req.params.category },
    });
    return res.status(200).json({ gifts });
  } catch (error) {
    console.log(error);
  }
};

const giftExchange = async (req, res) => {
  try {
    const { email, giftId } = req.body;
    const gift = await Gift.findOne({
      where: { id: giftId },
    });
    if (gift.totalCount <= 0) {
      return res.status(404).json({ message: "Out of gifts" });
    }

    const user = await User.findOne({ where: { email: email } });
    if (user.totalPoint < gift.point) {
      return res.status(404).json({ message: "Not enough point" });
    }

    (await gift.update({ totalCount: gift.totalCount - 1 })).save();
    (await user.update({ totalPoint: user.totalPoint - gift.point })).save();

    if (gift.category == "Card") {
      const cardCode = generateCardCode(10);
      const card = await Card.create({ code: cardCode });
      const history = await HistoryPoint.create({
        type: 0,
        point: gift.point,
        userId: user.id,
        giftId: gift.id,
        cardId: card.id,
      });
      return res.status(200).json({ message: "Success", card, history });
    }
    const history = await HistoryPoint.create({
      type: 0,
      point: gift.point,
      userId: user.id,
      giftId: gift.id,
    });
    res.status(200).json({ message: "Success", history });
  } catch (error) {
    console.log(error);
  }
};

export { getAllGift, getGiftByCategory, giftExchange };
