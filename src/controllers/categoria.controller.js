const Categoria = require('../src/models/categoria.model.js');

class CategoriaController {
    static async createCategoria(req, res) {
        try {
            const data = req.body;
            await Categoria.create(data);
            res.status(201).json({ message: 'Categoria creada exitosamente.' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

    static async updateCategoria(req, res) {
        try {
            const { id } = req.params;
            const data = req.body;
            await Categoria.update(id, data);
            res.status(200).json({ message: 'Categoria actualizada exitosamente' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }

    static async getAllCategorias(req, res) {
        try {
            const categorias = await Categoria.getAll();
            res.status(200).json(categorias);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }
}

module.exports = CategoriaController;
