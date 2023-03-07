const db = require("../config/database");

const findByEmail = async (email) => {
  const { rows } = await db.query("SELECT * FROM users WHERE email = $1", [email]);
  return rows;
}

module.exports = {
  findByEmail,
};