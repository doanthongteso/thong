import jwt from "jsonwebtoken";

const config = process.env;

const userAuth = (req, res, next) => {
  const token = req.headers["authorization"].slice(7);
  console.log(req.headers["authorization"]);
  if (!token) {
    return res.status(403).send("A token is required for authentication");
  }
  try {
    const decoded = jwt.verify(token, process.env.SECRET_KEY);
    if (decoded.role !== "user") throw err;
    req.body.email = decoded.email;
    req.body.user_id = decoded.user_id;
  } catch (err) {
    return res.status(401).send("Invalid Token");
  }
  return next();
};

const adminAuth = (req, res, next) => {
  const token = req.headers["authorization"].slice(7);
  console.log(req.headers["authorization"]);
  if (!token) {
    return res.status(403).send("A token is required for authentication");
  }
  try {
    const decoded = jwt.verify(token, process.env.SECRET_KEY);
    if (decoded.role !== "admin") throw err;
    req.body.email = decoded.email;
    req.body.user_id = decoded.user_id;
  } catch (err) {
    return res.status(401).send("Invalid Token");
  }
  return next();
};

const allAuth = (req, res, next) => {
  const token = req.headers["authorization"].slice(7);
  console.log(req.headers["authorization"]);
  if (!token) {
    return res.status(403).send("A token is required for authentication");
  }
  try {
    const decoded = jwt.verify(token, process.env.SECRET_KEY);
    if (decoded.role !== "admin" && decoded.role !== "user") throw err;
    req.body.email = decoded.email;
    req.body.user_id = decoded.user_id;
  } catch (err) {
    return res.status(401).send("Invalid Token");
  }
  return next();
};
export { userAuth, adminAuth, allAuth };
