const express = require('express');
const router = express.Router();
const AuthController = require('../src/controllers/auth.controller.js');

router.post('/login', AuthController.login);

module.exports = router;
