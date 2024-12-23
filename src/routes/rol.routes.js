const express = require('express');
const router = express.Router();
const RolController = require('../controllers/rol.controller.js');
const authMiddleware = require('../middleware/auth.js');

router.post('/', authMiddleware, RolController.createRol);
router.put('/:id', authMiddleware, RolController.updateRol);
router.get('/', authMiddleware, RolController.getAllRoles);

module.exports = router;