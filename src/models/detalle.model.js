const sql = require('mssql');
const pool = require('../src/config/db.js');

class DetalleOrden {
    static async update(idDetalleOrden, cantidad, precio) {
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .input('ID_DETALLE_ORDEN', sql.Int, idDetalleOrden)
            .input('CANTIDAD', sql.Int, cantidad)
            .input('PRECIO', sql.Float, precio)
            .execute('SP_ACTUALIZAR_DETALLE_ORDEN');
        return result;
    }
}

module.exports = DetalleOrden;
