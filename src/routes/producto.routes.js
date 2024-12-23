const express = require('express');
const router = express.Router();
const ProductoController = require('../src/controllers/producto.controller.js');
const authMiddleware = require('../src/middleware/auth');

router.post('/', authMiddleware, ProductoController.createProducto); 
router.put('/:id', authMiddleware, ProductoController.updateProducto);
router.get('/', authMiddleware, ProductoController.getAllProductos); 

module.exports = router;
