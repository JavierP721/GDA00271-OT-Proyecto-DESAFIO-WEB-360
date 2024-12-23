const Orden = require('../models/orden.model.js');
const DetalleOrden = require('../models/detalle.model.js');

class OrdenController {
    static async createOrden(req, res) {
        try {
            const data = req.body;
            await Orden.create(data);
            res.status(201).json({ message: 'Orden creada exitosamente' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

    static async updateOrden(req, res) {
        try {
            const { id } = req.params;
            const { idEstado } = req.body;
            await Orden.update(id, idEstado);
            res.status(200).json({ message: 'Estado de la orden actualizado exitosamente' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

    static async updateDetalleOrden(req, res) {
        try {
            const { idDetalleOrden } = req.params;
            const { cantidad, precio } = req.body;
            await DetalleOrden.update(idDetalleOrden, cantidad, precio);
            res.status(200).json({ message: 'Detalle de la orden actualizado exitosamente' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }
}

module.exports = OrdenController;
