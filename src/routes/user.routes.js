const router = require('express-promise-router')();
const userController = require('../controllers/user.controller');

router.post('/login', userController.login);
module.exports = router;