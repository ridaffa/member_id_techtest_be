const userService = require("../services/user.service");

exports.login = async (req, res) => {
  try {
    const { email } = req.body;
    if (!email) {
      return res.status(400).send({
        message: "Email is required",
      });
    }
    const emailRegex = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/;
    if (!emailRegex.test(email)) {
      return res.status(400).send({
        message: "Email is invalid",
      });
    }
    const token = await userService.login(email);
    if (!token) {
      return res.status(404).send({
        message: "User not found",
      });
    }
    res.status(200).send({
      message: token,
    });
  } catch (err) {
    res.status(500).send({
      message: "internal server error",
    });
  }
};