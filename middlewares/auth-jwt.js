// Este código es un middleware de autenticación de usuario que se utiliza para verificar si un usuario está autenticado antes de permitirle acceder a ciertas rutas o funcionalidades de la aplicación. El middleware tiene una sola función:

// verifyUserToken: Verifica si el usuario ha enviado un token de autorización en la solicitud (req.headers.authorization). Si no se ha enviado un token, se envía una respuesta con el estado 403 y un mensaje indicando que no se ha entregado el token.

// Si se ha enviado un token, se divide el token del encabezado de autorización en un arreglo y se toma el segundo elemento (el token verdadero)

// se utiliza el método verify de jwt para verificar la validez del token utilizando el secreto especificado en el archivo .env (process.env.JWT_SECRET). Si el token es válido, se agrega el id del usuario (decoded.id) al objeto de solicitud (req) y se llama al siguiente middleware o manejador de rutas. Si el token no es válido, se envía una respuesta con el estado 401 y un mensaje indicando que el usuario no tiene permiso.

// En resumen, este middleware es responsable de verificar si un usuario ha enviado un token válido en la solicitud antes de permitirle acceder a ciertas funcionalidades de la aplicación.Si el token es válido, se agrega el id del usuario al objeto de solicitud para su uso posterior.

// Finalmente, se define un objeto de autenticación JWT con una propiedad llamada verifyUserToken que es igual a la función verifyUserToken.

// El objeto "authJwt" se exporta para ser utilizado en otras partes de la aplicación.

// En este caso esta función de middleware se utiliza para asegurar que solo los usuarios autenticados tienen acceso a ciertas rutas o funcionalidades de la aplicación. El middleware se coloca en las rutas apropiadas para asegurar que solo los usuarios con un token válido puedan acceder a esas rutas.


const jwt = require("jsonwebtoken");
const dotenv = require('dotenv').config();
const process = require('process');
const db = require("../models");

verifyUserToken = (req, res, next) => {

    if (!req.headers.authorization) {
        return res.status(403).send({
            message: "No se ha entregado el token."
        });
    }

    let token = req.headers.authorization.split(' ')[1];


    jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {

        if (err) {
            return res.status(401).send({
                message: "No tiene permiso."
            });
        }

        req.userId = decoded.id;
        next();
    });
};

const authJwt = {
    verifyUserToken: verifyUserToken,
};

module.exports = authJwt;