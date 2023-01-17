// Este código es un servicio de correo electrónico que permite enviar correos electrónicos a través de un protocolo SMTP o mediante la API de Gmail. Utiliza la biblioteca NodeMailer para manejar la conexión con el servidor de correo electrónico y la biblioteca googleapis para manejar la autenticación con la API de Gmail. También utiliza la biblioteca dotenv para acceder a las variables de entorno y la biblioteca process para acceder a las variables de proceso. En este servicio se define un constructor que toma un tipo (SMTP o Gmail) y configura un transporte de correo electrónico en consecuencia. También define una función para enviar correos electrónicos y guardar los detalles del correo enviado en una tabla de base de datos.
// Además, el servicio define una función getAccessToken() que se utiliza para obtener un token de acceso actualizado a la API de Gmail utilizando una instancia de la clase OAuth2 de Google. Utiliza las variables de entorno especificadas en el archivo .env para configurar la conexión con la API de Gmail.

// La función sendEmail() recibe dos parámetros, el objeto de correo electrónico y el destinatario (que tiene un valor predeterminado de this.email si no se especifica un destinatario). Utiliza las opciones de correo electrónico especificadas en el objeto mailOptions para enviar el correo electrónico a través del transporte configurado en el constructor. Si el correo electrónico se envía con éxito, se guarda la información en una tabla de base de datos. Si hay un error al enviar el correo electrónico, se imprime un mensaje de error en la consola.





const nodemailer = require('nodemailer');
const { google } = require("googleapis");
const OAuth2 = google.auth.OAuth2;
const dotenv = require('dotenv').config();
const process = require('process');

//importamos el modelo de Email de la carpeta models
// Accedemos al modelo a traves de db
const db = require("../models");
const Email = db.Email;

module.exports = class EmailService {

    constructor(type) {

        if (type === 'smtp') {

            this.email = process.env.EMAIL;

            this.transport = nodemailer.createTransport({
                pool: true,
                host: process.env.EMAIL_HOST,
                port: process.env.EMAIL_PORT,
                secureConnection: true,
                auth: {
                    user: process.env.EMAIL,
                    pass: process.env.EMAIL_PASSWORD,
                },
                tls: {
                    ciphers: 'SSLv3'
                }
            });

        }

        else if (type === 'gmail') {

            this.email = process.env.GOOGLE_EMAIL;

            this.transport = nodemailer.createTransport({
                service: "gmail",
                auth: {
                    type: "OAuth2",
                    user: process.env.GOOGLE_EMAIL,
                    clientId: process.env.GOOGLE_CLIENT_ID,
                    clientSecret: process.env.GOOGLE_CLIENT_SECRET,
                    refreshToken: process.env.GOOGLE_REFRESH_TOKEN,
                    accessToken: this.getAccessToken()
                }
            });
        }
    }

    getAccessToken() {

        const myOAuth2Client = new OAuth2(
            process.env.GOOGLE_CLIENT_ID,
            process.env.GOOGLE_CLIENT_SECRET,
            "https://developers.google.com/oauthplayground"
        )

        myOAuth2Client.setCredentials({
            refresh_token: process.env.GOOGLE_REFRESH_TOKEN
        });

        const myAccessToken = myOAuth2Client.getAccessToken();

        return myAccessToken;
    }


    // Defimimos la funcion sendEmail con dos parametros
    // destination tiene un valor predetermidado que seria this.email que se utilizaria en caso de no 
    // definir un valor para este parametro
    sendEmail(email, destination = this.email) {

        // Se crea un objeto con toda la informacion del email a enviar
        const mailOptions = {
            from: this.email,
            to: destination,
            subject: email.subject,
            html: email.content
        }

        // Usamos la funcion transport para enviar el correo con la config. del objeto mailOptions
        this.transport.sendMail(mailOptions, function (err, result) {

            if (err) {
                console.log(err);
            } else {
                //Si no ha dado error se crea un objeto con la info que hay que guardar
                // en la tabla emails
                const emailInfo = {
                    email: destination,
                    message: email.content
                }

                // Usamos el modelo Email para crear un registro en la tabla emails
                // Si falla se imprime un error en consola
                Email.create(emailInfo).catch(err => {
                    console.log(err);
                });
            }
        });
    }
}
