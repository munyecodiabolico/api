const db = require("../../models");
const ImageConfiguration = db.ImageConfiguration;
const Op = db.Sequelize.Op;

exports.create = async (req, res) => {
    try{
        let data = await ImageConfiguration.create(req.body);
        res.status(200).send(data);
    }catch(error){
        res.status(500).send({
            message: error.message || "Algún error ha surgido al insertar el dato.",
            errors: error.errors
        });
    }
};

// exports.findAll = (req, res) => {

//     let whereStatement = {};

//     if(req.query.entity)
//         whereStatement.entity = {[Op.substring]: req.query.entity};
    
//     if(req.query.type)
//         whereStatement.type = {[Op.substring]: req.query.type};

//     if(req.query.grid)
//         whereStatement.grid = {[Op.substring]: req.query.grid};
    
//         if(req.query.quality)
//         whereStatement.quality = {[Op.substring]: req.query.quality};

//     let condition = Object.keys(whereStatement).length > 0 ? {[Op.and]: [whereStatement]} : {};

//     ImageConfiguration.findAll({ where: condition }).then(data => {
//         res.status(200).send(data);
//     }).catch(err => {
//         res.status(500).send({
//             message: err.message || "Algún error ha surgido al recuperar los datos."
//         });
//     });
// };

// exports.findOne = (req, res) => {

//     const id = req.params.id;

//     ImageConfiguration.findByPk(id).then(data => {

//         if (data) {
//             res.status(200).send(data);
//         } else {
//             res.status(404).send({
//                 message: `No se puede encontrar el elemento con la id=${id}.`
//             });
//         }

//     }).catch(err => {
//         res.status(500).send({
//             message: "Algún error ha surgido al recuperar la id=" + id
//         });
//     });
// };

exports.update = (req, res) => {

    const id = req.params.id;

    ImageConfiguration.update(req.body, {
        where: { id: id }
    }).then(num => {
        if (num == 1) {
            res.status(200).send({
                message: "El elemento ha sido actualizado correctamente."
            });
        } else {
            res.status(404).send({
                message: `No se puede actualizar el elemento con la id=${id}. Tal vez no se ha encontrado el elemento o el cuerpo de la petición está vacío.`
            });
        }
    }).catch(err => {
        res.status(500).send({
            message: "Algún error ha surgido al actualiazar la id=" + id
        });
    });
};

exports.delete = (req, res) => {

    const id = req.params.id;

    ImageConfiguration.destroy({
        where: { id: id }
    }).then(num => {
        if (num == 1) {
            res.status(200).send({
                message: "El elemento ha sido borrado correctamente"
            });
        } else {
            res.status(404).send({
                message: `No se puede borrar el elemento con la id=${id}. Tal vez no se ha encontrado el elemento.`
            });
        }
    }).catch(err => {
        res.status(500).send({
            message: "Algún error ha surgido al borrar la id=" + id
        });
    });
};