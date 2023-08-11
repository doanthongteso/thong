import Notification from "../model/Notification.js";

const getAllNotifications = async (req, res) => {
  try {
    const notification = await Notification.findAll();
    return res.status(200).json(notification);
  } catch (error) {
    console.log(error);
  }
};

export { getAllNotifications };
