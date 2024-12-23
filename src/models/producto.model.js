const sql = require('mssql');
const pool = require('../config/db.js');

class Producto {
    static async create(data) {
        const { idCategoria, idUsuario, nombreProducto, marca, codigo, stock, idEstado, precio, foto } = data;
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .input('ID_CATEGORIA', sql.Int, idCategoria)
            .input('ID_USUARIO', sql.Int, idUsuario)
            .input('NOMBRE_PRODUCTO', sql.NVarChar(45), nombreProducto)
            .input('MARCA', sql.NVarChar(45), marca)
            .input('CODIGO', sql.NVarChar(45), codigo)
            .input('STOCK', sql.Float, stock)
            .input('ID_ESTADO', sql.Int, idEstado)
            .input('PRECIO', sql.Float, precio)
            .input('FOTO', sql.VarBinary, foto)
            .execute('SP_AGREGAR_PRODUCTO');
        return result;
    }

    static async update(idProducto, data) {
        const { idCategoria, idUsuario, nombreProducto, marca, codigo, stock, idEstado, precio, foto } = data;
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .input('ID_PRODUCTO', sql.Int, idProducto)
            .input('ID_CATEGORIA', sql.Int, idCategoria)
            .input('ID_USUARIO', sql.Int, idUsuario)
            .input('NOMBRE_PRODUCTO', sql.NVarChar(45), nombreProducto)
            .input('MARCA', sql.NVarChar(45), marca)
            .input('CODIGO', sql.NVarChar(45), codigo)
            .input('STOCK', sql.Float, stock)
            .input('ID_ESTADO', sql.Int, idEstado)
            .input('PRECIO', sql.Float, precio)
            .input('FOTO', sql.VarBinary, foto)
            .execute('SP_ACTUALIZAR_PRODUCTO');
        return result;
    }

    static async getAll() {
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .query('SELECT * FROM TB_PRODUCTO');
        return result.recordset;
    }
}

module.exports = Producto;
