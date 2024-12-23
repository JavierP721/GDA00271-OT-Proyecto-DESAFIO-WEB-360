const express = require('express');
const router = express.Router();
const RolController = require('../src/controllers/rol.controller.js');
const authMiddleware = require('..src/middleware/auth.js');

router.post('/', authMiddleware, RolController.createRol);
router.put('/:id', authMiddleware, RolController.updateRol);
router.get('/', authMiddleware, RolController.getAllRoles);

module.exports = router;const express = require('express');