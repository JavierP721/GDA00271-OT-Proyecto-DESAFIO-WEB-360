const express = require('express');
const router = express.Router();
const EstadoController = require('../controllers/estado.controller');
const authMiddleware = require('../middleware/auth');

// Rutas para Estado
router.post('/', authMiddleware, EstadoController.createEstado);
router.put('/:id', authMiddleware, EstadoController.updateEstado); 
router.get('/', authMiddleware, EstadoController.getAllEstados);

module.exports = router;
