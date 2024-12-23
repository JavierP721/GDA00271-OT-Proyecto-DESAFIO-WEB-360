const sql = require('mssql');
const pool = require('../src/config/db.js');

class Estado {
    static async create(nombreEstado) {
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .input('NOMBRE_ESTADO', sql.NVarChar(45), nombreEstado)
            .execute('SP_AGREGAR_ESTADO');
        return result;
    }

    static async update(idEstado, nuevoNombre) {
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .input('ID_ESTADO', sql.Int, idEstado)
            .input('NUEVO_NOMBRE', sql.NVarChar(45), nuevoNombre)
            .execute('SP_EDITAR_ESTADO');
        return result;
    }

    static async getAll() {
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .query('SELECT * FROM TB_ESTADO');
        return result.recordset;
    }
}

module.exports = Estado;
