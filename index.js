// Este código es un script de Node.js que utiliza el framework Express.js para crear un servidor web.

// El código importa las siguientes dependencias:

// "express": es un framework para crear aplicaciones web y apis con Node.js
// "cors": es un middleware que permite controlar las solicitudes de origen cruzado (CORS) en una aplicación express.
// "fs": es un módulo de Node.js que proporciona una API para interactuar con el sistema de archivos.
// Se crea una instancia de Express y se asigna a una variable "app".

// Se utiliza el middleware "cors" y se establece un objeto "corsOptions" con las URLs permitidas para las solicitudes de origen cruzado.

// Se utilizan los middlewares "express.json" y "express.urlencoded" para manejar los datos de solicitud en formato JSON y formato de codificación de formulario, respectivamente.

// Se establece una variable "routePath" para especificar la ruta de los archivos de rutas.

// Utilizando el módulo fs, se lee el directorio "routePath" y se importan todos los archivos dentro del directorio, cada archivo es una ruta.

// Se establece una variable "PORT" para especificar el puerto en el que se ejecutará el servidor.

// Finalmente, se inicia el servidor en el puerto especificado y se imprime un mensaje en la consola para indicar que el servidor está en ejecución.


const express = require("express");
const cors = require("cors");
const fs = require('fs');
const app = express();
const db = require("./models");

var corsOptions = {
    origin: ['http://localhost:8081', 'http://127.0.0.1:5500', 'http://127.0.0.1:5501']
};

app.use(cors(corsOptions));
app.use(express.json({ limit: "10mb", extended: true }));
app.use(express.urlencoded({ limit: "10mb", extended: true, parameterLimit: 50000 }));


var routePath = "./routes/";

fs.readdirSync(routePath).forEach(function (file) {
    require(routePath + file)(app);
});

const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
    console.log(`El servidor está corriendo en el puerto ${PORT}.`);
});

