const express = require('express');
const router = express.Router();
const CategoriaController = require('../src/controllers/categoria.controller.js');
const authMiddleware = require('../src/middleware/auth');

router.post('/', authMiddleware, CategoriaController.createCategoria); 
router.put('/:id', authMiddleware, CategoriaController.updateCategoria); 
router.get('/', authMiddleware, CategoriaController.getAllCategorias);

module.exports = router;
