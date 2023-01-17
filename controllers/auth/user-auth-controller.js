// Este código es un ejemplo de cómo se puede manejar la autenticación de un usuario en una aplicación web, pero hay varias cosas adicionales que podrías considerar añadir para mejorar la seguridad y la funcionalidad de tu aplicación.

// Manejo de errores: Es importante manejar de manera adecuada los errores que puedan ocurrir en el proceso de autenticación, como por ejemplo, si la base de datos no está disponible.

// Refresco de token: Una vez que un usuario ha iniciado sesión, es posible que desees implementar un mecanismo para refrescar el token de acceso una vez que ha expirado, de modo que el usuario no tenga que volver a iniciar sesión.

// Protección contra ataques: Es importante proteger tu aplicación contra ataques como el fuerza bruta o el robo de sesión, usando medidas como el bloqueo temporal de cuentas después de varios intentos fallidos de inicio de sesión, o el uso de tokens de acceso de un solo uso.

// Autorización: Una vez que un usuario ha iniciado sesión, es posible que desees implementar un mecanismo para controlar qué acciones puede realizar el usuario dentro de tu aplicación, mediante el uso de roles y permisos.

// Encriptación de contraseñas: Es importante encriptar las contraseñas de los usuarios antes de almacenarlas en la base de datos, para protegerlas de posibles ataques.

const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const dotenv = require('dotenv').config();
const process = require('process');
const db = require("../../models");
const User = db.User;

exports.signin = (req, res) => {

    User.findOne({
        where: {
            email: req.body.email
        }
    })
        .then(user => {

            if (!user) {

                return res.status(404).send({ message: "Usuario o contraseña incorrecta" });
            }

            let passwordIsValid = bcrypt.compareSync(
                req.body.password,
                user.password
            );

            if (!passwordIsValid) {

                return res.status(404).send({
                    accessToken: null,
                    message: "Usuario o contraseña incorrecta"
                });
            }

            let token = jwt.sign({ id: user.id }, process.env.JWT_SECRET, {
                expiresIn: 86400
            });

            res.status(200).send({
                id: user.id,
                name: user.name,
                email: user.email,
                accessToken: token
            });
        })
        .catch(err => {
            res.status(500).send({ message: err.message });
        });
};
