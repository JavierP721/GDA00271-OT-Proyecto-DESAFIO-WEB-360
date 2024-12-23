const express = require('express');
const router = express.Router();
const OrdenController = require('../src/controllers/orden.controller,.js');
const authMiddleware = require('../src/middleware/auth');

router.post('/', authMiddleware, OrdenController.createOrden); 
router.put('/:id', authMiddleware, OrdenController.updateOrden); 
router.put('/detalle/:idDetalleOrden', authMiddleware, OrdenController.updateDetalleOrden);

module.exports = router;