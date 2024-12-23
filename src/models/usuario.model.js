const sql = require('mssql');
const pool = require('../config/db.js');

class Usuario {
    static async create(data) {
        const { idRol, idEstado, correo, nombreCompleto, password, telefono, fechaNacimiento, idCliente } = data;
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .input('ID_ROL', sql.Int, idRol)
            .input('ID_ESTADO', sql.Int, idEstado)
            .input('CORREO', sql.NVarChar(45), correo)
            .input('NOMBRE_COMPLETO', sql.NVarChar(45), nombreCompleto)
            .input('PASSWORD_USUARIO', sql.NVarChar(45), password)
            .input('TELEFONO', sql.NVarChar(8), telefono)
            .input('FECHA_NAC', sql.Date, fechaNacimiento)
            .input('ID_CLIENTE', sql.Int, idCliente)
            .execute('SP_AGREGAR_USUARIO');
        return result;
    }

    static async update(idUsuario, data) {
        const { idRol, idEstado, correo, nombreCompleto, password, telefono, fechaNacimiento, idCliente } = data;
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .input('ID_USUARIO', sql.Int, idUsuario)
            .input('ID_ROL', sql.Int, idRol)
            .input('ID_ESTADO', sql.Int, idEstado)
            .input('CORREO', sql.NVarChar(45), correo)
            .input('NOMBRE_COMPLETO', sql.NVarChar(45), nombreCompleto)
            .input('PASSWORD_USUARIO', sql.NVarChar(45), password)
            .input('TELEFONO', sql.NVarChar(8), telefono)
            .input('FECHA_NAC', sql.Date, fechaNacimiento)
            .input('ID_CLIENTE', sql.Int, idCliente)
            .execute('SP_ACTUALIZAR_USUARIO');
        return result;
    }

    static async getAll() {
        const poolConnection = await pool;
        const result = await poolConnection.request()
            .query('SELECT * FROM TB_USUARIO');
        return result.recordset;
    }
}

module.exports = Usuario;
