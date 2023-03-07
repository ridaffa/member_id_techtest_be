const userRepo = require("../repositories/user.repository");
const jwt = require("jsonwebtoken");
const config = require("../config/auth");

const login = async (email) => {
  const rows = await userRepo.findByEmail(email);
  if (rows.length === 0) {
    return null;
  }
  const token = jwt.sign({ id: rows[0].id }, config.secret, {
    expiresIn: process.env.TOKEN_EXPIRY,
  });
  return token;
};

module.exports = {
  login,
};