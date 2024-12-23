//importacion y configuracion inicial 
const express = require('express'); //framework, cracion de servidor
const app = express(); //creacion de instancia de aplicacion
const PORT = process.env.PORT || 3000; //definicion del puerto y sino encuentra usa el 3000

//middleware para manejo de JSON
app.use(express.json());

//ruta de prueba
app.get('/', (req, res) =>{ //solicitud - cuando alguien acceda a la raiz de la aplicacion
    res.send('Servidor trabajando')
});

//iniciar el servidor 
app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`)
})

const rolRoutes = require('./src/routes/rol.routes'); // Importar las rutas de Rol
app.use('/rol', rolRoutes); // Asignar el prefijo '/rol' a las rutas de Rol

const estadoRoutes = require('./src/routes/estado.routes'); // Importar las rutas
app.use('/estado', estadoRoutes); // Asignar el prefijo 

const clienteRoutes = require('./src/routes/cliente.routes');
app.use('/cliente', clienteRoutes);

const usuarioRoutes = require('./src/routes/usuario.routes');
app.use('/usuario', usuarioRoutes);

const categoriaRoutes = require('./src/routes/categoria.routes');
app.use('/categoria', categoriaRoutes);

const productoRoutes = require('./src/routes/producto.routes');
app.use('/producto', productoRoutes);

const ordenRoutes = require('./src/routes/orden.routes');
app.use('/orden', ordenRoutes);

const authRoutes = require('./src/routes/auth.routes');
app.use('/auth', authRoutes);





