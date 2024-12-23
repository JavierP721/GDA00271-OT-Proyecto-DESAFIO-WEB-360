const Cliente = require('../models/cliente.model.js');

class ClienteController {
    static async createCliente(req, res) {
        try {
            const data = req.body;
            await Cliente.create(data);
            res.status(201).json({ message: 'Cliente creado exitosamente' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

    static async updateCliente(req, res) {
        try {
            const { id } = req.params;
            const data = req.body;
            await Cliente.update(id, data);
            res.status(200).json({ message: 'Cliente actualizado exitosamente' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

    static async getAllClientes(req, res) {
        try {
            const clientes = await Cliente.getAll();
            res.status(200).json(clientes);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }
}

module.exports = ClienteController;
