const express = require('express');
const router = express.Router();
const UsuarioController = require('../src/controllers/usuario.controller,js');
const authMiddleware = require('../src/middleware/auth');

router.post('/', authMiddleware, UsuarioController.createUsuario);
router.put('/:id', authMiddleware, UsuarioController.updateUsuario); 
router.get('/', authMiddleware, UsuarioController.getAllUsuarios); 

module.exports = router;
