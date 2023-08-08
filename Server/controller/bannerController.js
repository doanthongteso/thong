import Banner from "../model/Banner.js";

const getBanners = async (req, res) => {
  try {
    const banner = await Banner.findAll();
    return res.status(200).json(banner);
  } catch (error) {
    console.error(error);
  }
};

const uploadBanner = async (req, res) => {
  try {
    console.log(req.file);
    const banner = await Banner.create({ imgUrl: req.file.path });
    return res.status(200).json(banner);
  } catch (error) {
    console.error(error);
  }
};

export { getBanners, uploadBanner };
