const jwt = require("jsonwebtoken");
const config = require("../config/auth.js");

verifyToken = (req, res, next) => {
  const tokenheader = req.headers["authorization"];
  if (!tokenheader) {
    return res.status(403).send({
      message: "Unauthorized!"
    });
  }
  const token = tokenheader.split(" ")[1];

  if (!token) {
    return res.status(403).send({
      message: "Unauthorized!"
    });
  }

  jwt.verify(token, config.secret, (err, decoded) => {
    if (err) {
      return res.status(401).send({
        message: "Unauthorized!"
      });
    }
    req.userId = decoded.id;
    next();
  });
};

const authJwt = {
  verifyToken: verifyToken
};

module.exports = authJwt;