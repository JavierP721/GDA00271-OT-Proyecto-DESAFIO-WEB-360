const express = require('express');
const router = express.Router();
const AuthController = require('../controllers/auth.controller.js');

router.post('/login', AuthController.login);

module.exports = router;
