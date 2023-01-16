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

        if(type === 'smtp') {

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
                    ciphers:'SSLv3'
                }
            });

        } 
        
        else if(type === 'gmail') {

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
