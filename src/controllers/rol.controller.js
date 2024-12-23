const Rol = require('../models/rol.model');

class RolController {
    static async createRol(req, res) {
        try {
            const { nombreRol } = req.body;
            await Rol.create(nombreRol);
            res.status(201).json({ message: 'Rol creado exitosamente' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

    static async updateRol(req, res) {
        try {
            const { id } = req.params;
            const { nuevoNombre } = req.body;
            await Rol.update(id, nuevoNombre);
            res.status(200).json({ message: 'Rol actualizado exitosamente' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

    static async getAllRoles(req, res) {
        try {
            const roles = await Rol.getAll();
            res.status(200).json(roles);
        } catch (error) {
            res.status(500).send('Error al obtener los roles');
        }
    }
}

module.exports = RolController;