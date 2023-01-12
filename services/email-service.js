const nodemailer = require('nodemailer');
const { google } = require("googleapis");
const OAuth2 = google.auth.OAuth2;
const dotenv = require('dotenv').config();
const process = require('process');

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

    sendEmail(email, destination = this.email) {
        
        const mailOptions = {
            from: this.email, 
            to: destination,
            subject: email.subject,
            html: email.content
        }

        this.transport.sendMail(mailOptions, function (err, result) {
            if (err) {
                console.log(err);
            } else {




                const db = require("../../models");
                const Contact = db.Contact;
    
                exports.create = (req, res) => {
                    Contact.create(req.body).then(data => {
                        res.status(200).send(data);
                    }).catch(err => {
                        res.status(500).send({
                            message: err.message || "Algún error ha surgido al insertar el dato."
                        });
                    });
                };
                



                
            }
        });
    }
}
