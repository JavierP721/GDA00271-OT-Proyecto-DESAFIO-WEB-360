const sql = require('mssql');
const pool = require('../config/db.js');

class Cliente {
    static async create(data) {
        const { razonSocial, nombreComercial, direccionEntrega, telefono, email } = data;
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .input('RAZON_SOCIAL', sql.NVarChar(245), razonSocial)
            .input('NOMBRE_COMERCIAL', sql.NVarChar(345), nombreComercial)
            .input('DIRECCION_ENTREGA', sql.NVarChar(100), direccionEntrega)
            .input('TELEFONO', sql.NVarChar(8), telefono)
            .input('EMAIL', sql.NVarChar(45), email)
            .execute('SP_AGREGAR_CLIENTE');
        return result;
    }

    static async update(idCliente, data) {
        const { razonSocial, nombreComercial, direccionEntrega, telefono, email } = data;
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .input('ID_CLIENTE', sql.Int, idCliente)
            .input('RAZON_SOCIAL', sql.NVarChar(245), razonSocial)
            .input('NOMBRE_COMERCIAL', sql.NVarChar(345), nombreComercial)
            .input('DIRECCION_ENTREGA', sql.NVarChar(100), direccionEntrega)
            .input('TELEFONO', sql.NVarChar(8), telefono)
            .input('EMAIL', sql.NVarChar(45), email)
            .execute('SP_ACTUALIZAR_CLIENTE');
        return result;
    }

    static async getAll() {
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .query('SELECT * FROM TB_CLIENTE');
        return result.recordset;
    }
}

module.exports = Cliente;
