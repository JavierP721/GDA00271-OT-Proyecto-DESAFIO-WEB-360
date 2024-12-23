const bcrypt = require('bcryptjs');
const { generateToken, comparePasswords } = require('../src/middleware/auth');
const Usuario = require('../src/models/usuario.model.js');

class AuthController {
    static async login(req, res) {
        const { correo, password } = req.body;
        try {
           
            const usuario = await Usuario.findByCorreo(correo);
            if (!usuario) return res.status(404).json({ message: 'Usuario no encontrado' });

            const isMatch = await comparePasswords(password, usuario.PASSWORD_USUARIO);
            if (!isMatch) return res.status(400).json({ message: 'Contraseña incorrecta' });

            const token = generateToken(usuario);

            res.status(200).json({ token });
        } catch (error) {
            res.status(500).json({ message: 'Error en el servidor', error });
        }
    }
}

module.exports = AuthController;
