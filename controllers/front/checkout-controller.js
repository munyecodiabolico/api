const EmailService = require("../../services/email-service");
const db = require("../../models");
const Customer = db.Customer;

// Utilizamos la funcion sendEmail para enviar un correo electronico y almacenarlo en la base de datos
exports.payment = (req, res) => {
     // Guardamos en la tabla de Customers todos los datos creando un nuevo registro
    Customer.create(req.body).then(data => {
        res.status(200).send(data);
    }).catch(err => {
        res.status(500).send({
            message: err.message || "Algún error ha surgido al insertar el dato."
        });
    });

       // en el content podemos introducir codigo html con las variables y nos mandara el correo
    // con los estilos asignados

    // Creamos el objeto email con el contenido que tendra el correo
    let clientEmail = {
        subject: "Compra realizada correctamente en Vegan Restaurant",
        content: `
<p><strong style="font-size:1.2rem; color:blue;">${req.body.name} ${req.body.surname}</strong></p>
<div>
<b style="color:blue;">Datos de contacto:</b>
    <b>Telefono:</b> ${req.body.phone}
    <b>Correo:</b> ${req.body.email}
    <b>Población:</b> ${req.body.postalCode} ${req.body.city}
    <b>Dirección:</b> ${req.body.address}
    <br/><br/><br/>
    <p>La compra ha concluido con éxito. Si tiene alguna duda puede contactar con nosotros desde nuestra propia web o al tel. 111111111</p>
</div>`
    }

    let shopEmail = {
        subject: `Nueva compra realizada por ${req.body.name}`,
        content: `
<p><strong style="font-size:1.2rem; color:blue;">${req.body.name} ${req.body.surname}</strong></p>
<div>
<b style="color:blue;">Datos de contacto:</b>
    <b>Telefono:</b> ${req.body.phone}
    <b>Correo:</b> ${req.body.email}
    <b>Población:</b> ${req.body.postalCode} ${req.body.city}
    <b>Dirección:</b> ${req.body.address}
    <br/><br/><br/>
    <p>Compra finalizada con exito por parte de ${req.body.name}</p>
</div>`
    }
    // Instanciamos el servicio y los parametros que van en sendEmail si dejamos solo email, nos lo manda
    // directamente a nosotros, si añadimos un correo se envia al correo en concreto, si queremos mandar a varios
    // separamos por comas

    // Llamamos al servicio de Email que mandara el email
    // a traves de su metodo sendEmail enviamos al correo especificado
    // Si no ponemos correo nos lo manda a nosotros mismos
    new EmailService("gmail").sendEmail(clientEmail, req.body.email);
    new EmailService("gmail").sendEmail(shopEmail);
};