const sql = require('mssql');
const pool = require('../src/config/db.js');

class Categoria {
    static async create(data) {
        const { idUsuario, nombreCategoria, idEstado } = data;
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .input('ID_USUARIO', sql.Int, idUsuario)
            .input('CATEGORIA', sql.NVarChar(45), nombreCategoria)
            .input('ID_ESTADO', sql.Int, idEstado)
            .execute('SP_AGREGAR_CATEGORIA');
        return result;
    }

    static async update(idCategoria, data) {
        const { idUsuario, nombreCategoria, idEstado } = data;
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .input('ID_CATEGORIA', sql.Int, idCategoria)
            .input('ID_USUARIO', sql.Int, idUsuario)
            .input('CATEGORIA', sql.NVarChar(45), nombreCategoria)
            .input('ID_ESTADO', sql.Int, idEstado)
            .execute('SP_ACTUALIZAR_CATEGORIA');
        return result;
    }

    static async getAll() {
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .query('SELECT * FROM TB_CATEGORIA_PRODUCTO');
        return result.recordset;
    }
}

module.exports = Categoria;
