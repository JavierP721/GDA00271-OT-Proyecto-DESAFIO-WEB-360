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

const poolPromise = new sql.ConnectionPool(dbConfig)

    .connect()
    .then((pool) => {
        console.log('Conexion a la base de datos realizada')
        return pool;
    })

    .catch((error) => 
        console.error('Error al conectar a la base de datos: ', error));

module.exports = poolPromise;