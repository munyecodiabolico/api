const EmailService = require("../../services/email-service");
const db = require("../../models");
const Contact = db.Contact;

exports.sendEmail = (req, res) => {
    // en el content podemos introducir codigo html con las variables y nos mandara el correo
    // con los estilos asignados
    let email = {
        subject: "Mensaje inventaoooooo",
        content: req.body.mensaje
    }
    // Instanciamos el servicio y los parametros que van en sendEmail si dejamos solo email, nos lo manda
    // directamente a nosotros, si añadimos un correo se envia al correo en concreto, si queremos mandar a varios
    // separamos por comas
    new EmailService("gmail").sendEmail(email, "dissenyramon@gmail.com");
// 
    Contact.create(req.body).then(data => {
        res.status(200).send(data);
    }).catch(err => {
        res.status(500).send({
            message: err.message || "Algún error ha surgido al insertar el dato."
        });
    });
};