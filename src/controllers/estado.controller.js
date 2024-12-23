const Estado = require('../models/estado.model');

class EstadoController {
    static async createEstado(req, res) {
        try {
            const { nombreEstado } = req.body;
            await Estado.create(nombreEstado);
            res.status(201).json({ message: 'Estado creado exitosamente' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

    static async updateEstado(req, res) {
        try {
            const { id } = req.params;
            const { nuevoNombre } = req.body;
            await Estado.update(id, nuevoNombre);
            res.status(200).json({ message: 'Estado actualizado exitosamente' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

    static async getAllEstados(req, res) {
        try {
            const estados = await Estado.getAll();
            res.status(200).json(estados);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }
}

module.exports = EstadoController;
