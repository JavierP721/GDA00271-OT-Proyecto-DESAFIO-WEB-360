const sql = require('mssql');
const pool = require('..src/config/db.js')

class Rol {
    static async create (nombreRol) {
        try {
            const result = await pool.request()
                .input('NOMBRE_ROL', sql.NVarChar(45), nombreRol)
                .execute('SP_AGREGAR_ROL');
            return result;
        } catch (error) {
            console.error('Error al crear un rol:', error);
            throw error;
        }
    }


    static async update(idRol, nuevoNombre) {
        try {
            const result = await pool.request()
                .input('ID_ROL', sql.Int, idRol)
                .input('NOMBRE_NOMBRE', sql.NVarChar(45), nuevoNombre)
                .execute('SP_EDITAR_ROL');
            return result;
            } catch (error) {
                console.error('Error al actualizar un rol:', error);
                throw error;
         }
    }

    static async getAll() {
        try {
            const result = await pool.request()
                .query('SELECT * FROM TB_ROL');
            return result.recordset;
        } catch (error) {
            console.error('Error al obtener los roles:', error);
            throw error;
        }
    }
}

module.exports = Rol;
