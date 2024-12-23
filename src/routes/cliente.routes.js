const express = require('express');
const router = express.Router();
const ClienteController = require('../src/controllers/cliente.controller,js');
const authMiddleware = require('../src/middleware/auth');

router.post('/', authMiddleware, ClienteController.createCliente); 
router.put('/:id', authMiddleware, ClienteController.updateCliente); 
router.get('/', authMiddleware, ClienteController.getAllClientes);

module.exports = router;
