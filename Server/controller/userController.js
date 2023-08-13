import User from "../model/User.js";
import bcrypt from "bcryptjs";
const getAllUser = async (req, res) => {
  try {
    const user = await User.findAll({ order: [["createdAt", "DESC"]] });
    res.status(200).json({ user });
  } catch (error) {
    console.error(error);
  }
};

const getUserByEmail = async (req, res) => {
  const { email } = req.body;
  try {
    const user = await User.findOne({ where: { email: email } });
    res.status(200).json({ user });
  } catch (error) {
    console.error(error);
  }
};

const updateUser = async (req, res) => {
  const { user_id } = req.body;
  try {
    const user = await User.update(
      { name: req.body.name, phone: req.body.phone, address: req.body.address },
      { where: { id: user_id } }
    );
    res.status(200).json({ message: "Success", user });
  } catch (error) {
    console.error(error);
  }
};

const banUser = async (req, res) => {
  try {
    const { id } = req.params;
    await User.update({ isActive: false }, { where: { id: id } });
    res.status(200).json({ message: "Banned" });
  } catch (error) {
    console.log(error);
  }
};

const activeUser = async (req, res) => {
  try {
    const { id } = req.params;
    await User.update({ isActive: true }, { where: { id: id } });
    res.status(200).json({ message: "Activated" });
  } catch (error) {
    console.log(error);
  }
};

const changePassword = async (req, res) => {
  const { user_id, oldPassword, newPassword } = req.body;
  try {
    const user = await User.findOne({ where: { id: user_id } });
    console.log(newPassword);
    if (user && (await bcrypt.compare(oldPassword, user.password))) {
      const encryptedPassword = await bcrypt.hash(newPassword, 10);
      (await user.update({ password: encryptedPassword })).save();
      return res.status(200).json({ message: "Success", user });
    } else if (!(await bcrypt.compare(oldPassword, user.password))) {
      return res.status(409).json({ message: "wrong password" });
    }
    return res.status(409).json({ message: "error" });
  } catch (error) {
    console.error(error);
  }
};

const deleteUser = async (req, res) => {
  const { id } = req.params;
  try {
    const user = await User.destroy({ where: { id: id } });
    res.status(200).json({ user });
  } catch (error) {
    console.error(error);
  }
};

export {
  getAllUser,
  getUserByEmail,
  updateUser,
  deleteUser,
  changePassword,
  banUser,
  activeUser,
};
