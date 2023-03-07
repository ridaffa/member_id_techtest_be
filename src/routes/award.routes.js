const router = require('express-promise-router')();
const awardController = require('../controllers/award.controller');
const authJwt = require('../middlewares/authJwt');

router.get('/', [
  authJwt.verifyToken
], awardController.find);
module.exports = router;