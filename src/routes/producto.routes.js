const express = require('express');
const router = express.Router();
const ProductoController = require('../controllers/producto.controller.js');
const authMiddleware = require('../middleware/auth');

router.post('/', authMiddleware, ProductoController.createProducto); 
router.put('/:id', authMiddleware, ProductoController.updateProducto);
router.get('/', authMiddleware, ProductoController.getAllProductos); 

module.exports = router;
