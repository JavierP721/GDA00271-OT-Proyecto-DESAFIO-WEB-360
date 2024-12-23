const express = require('express');
const router = express.Router();
const CategoriaController = require('../controllers/categoria.controller.js');
const authMiddleware = require('../middleware/auth');

router.post('/', authMiddleware, CategoriaController.createCategoria); 
router.put('/:id', authMiddleware, CategoriaController.updateCategoria); 
router.get('/', authMiddleware, CategoriaController.getAllCategorias);

module.exports = router;
