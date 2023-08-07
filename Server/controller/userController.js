import User from "../model/User.js";

const getAllUser = async (req, res) => {
  try {
    const user = await User.findAll();
    res.status(200).json({ user });
  } catch (error) {
    console.error(error);
  }
};

const getUserByEmail = async (req, res) => {
  const { email } = req.body;
  try {
    const user = await User.findOne({ where: { email: email } });
    console.log(email);
    res.status(200).json({ user });
  } catch (error) {
    console.error(error);
  }
};

const updateUser = async (req, res) => {
  const { id } = req.params;
  try {
    const user = await User.update(req.body, { where: { id: id } });
    res.status(200).json({ user });
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
export { getAllUser, getUserByEmail, updateUser, deleteUser };
