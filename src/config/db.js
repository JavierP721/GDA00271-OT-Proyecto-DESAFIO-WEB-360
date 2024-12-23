const sql = require('mssql')

const dbConfig = {
    user: 'sa',
    password: 'Umg$2024',
    server: 'localhost',
    database: 'GDA00271_OT_JAVIER_PIRIR',
    options: {
        encrypt: true,
        trustServerCertificate: true
    },

};

const poolPromise = new sql.connectionPool(dbConfig)

    .connnect()
    .then((pool) => {
        console.log('Conexion a la base de datos realizada')
        return pool;
    })

    .catch((err) => 
        console.error('Error al conectar a la base de datos: ', error));

module.exports = poolPromise;