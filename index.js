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