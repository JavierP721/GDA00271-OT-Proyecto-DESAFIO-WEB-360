const sql = require('mssql');
const pool = require('../src/config/db.js');

class Orden {
    static async create(data) {
        const { idUsuario, idEstado, nombreCompleto, direccion, telefono, correo, fechaEntrega, detalles } = data;
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .input('ID_USUARIO', sql.Int, idUsuario)
            .input('ID_ESTADO', sql.Int, idEstado)
            .input('NOMBRE_COMPLETO', sql.NVarChar(45), nombreCompleto)
            .input('DIRECCION', sql.NVarChar(100), direccion)
            .input('TELEFONO', sql.NVarChar(8), telefono)
            .input('CORREO', sql.NVarChar(45), correo)
            .input('FECHA_ENTREGA', sql.Date, fechaEntrega)
            .input('DETALLES', sql.NVarChar, JSON.stringify(detalles))
            .execute('SP_CREAR_ORDEN_JSON');
        return result;
    }

    static async update(idOrden, idEstado) {
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .input('ID_ORDEN', sql.Int, idOrden)
            .input('ID_ESTADO', sql.Int, idEstado)
            .execute('SP_ACTUALIZAR_ORDEN');
        return result;
    }
}

module.exports = Orden;
