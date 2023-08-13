import Notification from "../model/Notification.js";

const getAllNotifications = async (req, res) => {
  try {
    const notification = await Notification.findAll({
      order: [["createdAt", "DESC"]],
    });
    return res.status(200).json(notification);
  } catch (error) {
    console.log(error);
  }
};

const createNotification = async (req, res) => {
  try {
    await Notification.create({
      title: req.body.title,
      description: req.body.description,
    });
    return res.status(200).json({ message: "Success" });
  } catch (error) {
    console.log(error);
  }
};

const updateNotification = async (req, res) => {
  try {
    const { id } = req.params;
    const notification = await Notification.update(
      { title: req.body.title, description: req.body.description },
      { where: { id: id } }
    );
    return res.status(200).json({ message: "Success" });
  } catch (error) {
    console.log(error);
  }
};
const deleteNotification = async (req, res) => {
  try {
    const { id } = req.params;
    await Notification.destroy({ where: { id: id } });
    return res.status(200).json({ message: "Success" });
  } catch (error) {
    console.log(error);
  }
};
export { getAllNotifications, updateNotification, deleteNotification ,createNotification};
