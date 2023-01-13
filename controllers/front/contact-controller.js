const EmailService = require("../../services/email-service");
const db = require("../../models");
const Contact = db.Contact;


// Utilizamos la funcion sendEmail para enviar un correo electronico y almacenarlo en la base de datos
exports.sendEmail = (req, res) => {
    // en el content podemos introducir codigo html con las variables y nos mandara el correo
    // con los estilos asignados

    // Creamos el objeto email con el contenido que tendra el correo
    let email = {
        subject: "Mensaje inventaoooooo",
        content: req.body.message
    }
    // Instanciamos el servicio y los parametros que van en sendEmail si dejamos solo email, nos lo manda
    // directamente a nosotros, si añadimos un correo se envia al correo en concreto, si queremos mandar a varios
    // separamos por comas

    // Llamamos al servicio de Email que mandara el email
    // a traves de su metodo sendEmail enviamos al correo especificado
    // Si no ponemos correo nos lo manda a nosotros mismos
    new EmailService("gmail").sendEmail(email, "dissenyramon@gmail.com");
    
    // Guardamos en la tabla de contactos todos los datos creando un nuevo registro en contactos
    Contact.create(req.body).then(data => {
        res.status(200).send(data);
    }).catch(err => {
        res.status(500).send({
            message: err.message || "Algún error ha surgido al insertar el dato."
        });
    });
};