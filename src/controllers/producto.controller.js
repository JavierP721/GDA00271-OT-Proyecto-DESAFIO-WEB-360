const Producto = require('../src/models/producto.model.js');

class ProductoController {
    static async createProducto(req, res) {
        try {
            const data = req.body;
            await Producto.create(data);
            res.status(201).json({ message: 'Producto creado exitosamente.' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

    static async updateProducto(req, res) {
        try {
            const { id } = req.params;
            const data = req.body;
            await Producto.update(id, data);
            res.status(200).json({ message: 'Producto actualizado exitosamente' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

    static async getAllProductos(req, res) {
        try {
            const productos = await Producto.getAll();
            res.status(200).json(productos);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }
}

module.exports = ProductoController;
