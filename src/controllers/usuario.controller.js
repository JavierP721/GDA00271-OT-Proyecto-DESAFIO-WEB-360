const Usuario = require('../src/models/usuario.model.js');

class UsuarioController {
    static async createUsuario(req, res) {
        try {
            const data = req.body;
            await Usuario.create(data);
            res.status(201).json({ message: 'Usuario creado exitosamente' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

    static async updateUsuario(req, res) {
        try {
            const { id } = req.params;
            const data = req.body;
            await Usuario.update(id, data);
            res.status(200).json({ message: 'Usuario actualizado exitosamente' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

    static async getAllUsuarios(req, res) {
        try {
            const usuarios = await Usuario.getAll();
            res.status(200).json(usuarios);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }
}

module.exports = UsuarioController;
