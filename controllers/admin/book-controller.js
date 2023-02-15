// Este código es un controlador de negocios que se utiliza para manejar operaciones CRUD (crear, leer, actualizar y borrar) en una base de datos. El controlador tiene las siguientes funciones:

// create: Crea un nuevo negocio en la base de datos. La función toma el cuerpo de la solicitud (req.body) y utiliza el modelo de negocios para crear un nuevo registro en la base de datos. Si la operación es exitosa, se envía una respuesta con el estado 200 y los datos del negocio creado. En caso contrario, se envía un mensaje de error.

// findAll: Recupera todos los negocios de la base de datos. La función utiliza el modelo de negocios para buscar todos los registros en la base de datos y los devuelve en la respuesta. Si la operación es exitosa, se envía una respuesta con el estado 200 y los datos de los negocios. En caso contrario, se envía un mensaje de error.

// findOne: Recupera un negocio específico de la base de datos. La función toma el id del negocio de los parámetros de la ruta (req.params.id) y utiliza el modelo de negocios para buscar un registro en la base de datos con esa id. Si se encuentra el negocio, se envía una respuesta con el estado 200 y los datos del negocio. En caso contrario, se envía un mensaje de error indicando que no se pudo encontrar el negocio.

// update: Actualiza un negocio existente en la base de datos. La función toma el id del negocio de los parámetros de la ruta (req.params.id) y el cuerpo de la solicitud (req.body), y utiliza el modelo de negocios para actualizar el registro en la base de datos con esa id. Si la operación es exitosa, se envía una respuesta con el estado 200 y un mensaje indicando que el negocio ha sido actualizado correctamente. En caso contrario, se envía un mensaje de error indicando que no se pudo actualizar el negocio.

// delete: Elimina un negocio existente en la base de datos. La función toma el id del negocio de los parámetros de la ruta (req.params.id) y utiliza el modelo de negocios para eliminar el registro de la base de datos con esa id. Si la operación es exitosa, se envía una respuesta con el estado 200 y un mensaje indicando que el negocio ha sido eliminado correctamente. En caso contrario, se envía un mensaje de error indicando que no se pudo eliminar el negocio.
// En resumen, este controlador es responsable de manejar las operaciones CRUD para los negocios en la base de datos. Utiliza el modelo de negocios para interactuar con la base de datos y envia respuestas apropiadas al cliente dependiendo del resultado de la operación realizada.





const db = require("../../models");
const Book = db.Book;
const Op = db.Sequelize.Op;

exports.create = (req, res) => {

    Book.create(req.body).then(data => {
        res.status(200).send(data);
    }).catch(err => {
        res.status(500).send({
            message: err.message || "Algún error ha surgido al insertar el dato."
        });
    });
};

exports.findAll = (req, res) => {

    let page = req.query.page || 1;
    let limit = parseInt(req.query.size) || 10;
    let offset = (page - 1) * limit;

    let whereStatement = {};

    for (let key in req.query) {
        if (req.query[key] != "" && key != "page" && key != "size") {
            whereStatement[key] = {[Op.substring]: req.query[key]};
        }
    }

    let condition = Object.keys(whereStatement).length > 0 ? {[Op.and]: [whereStatement]} : {};

    Book.findAndCountAll({
        where: condition, 
        limit: limit,
        offset: offset,
        order: [['createdAt', 'DESC']]
    })
    .then(result => {

        result.meta = {
            total: result.count,
            pages: Math.ceil(result.count / limit),
            currentPage: page
        };

        res.status(200).send(result);

    }).catch(err => {
        res.status(500).send({
            message: err.errors || "Algún error ha surgido al recuperar los datos."
        });
    });
};

exports.findOne = (req, res) => {

    const id = req.params.id;

    Book.findByPk(id).then(data => {

        if (data) {
            res.status(200).send(data);
        } else {
            res.status(404).send({
                message: `No se puede encontrar el elemento con la id=${id}.`
            });
        }

    }).catch(err => {
        res.status(500).send({
            message: "Algún error ha surgido al recuperar la id=" + id
        });
    });
};

exports.update = (req, res) => {

    const id = req.params.id;

    Book.update(req.body, {
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

    Book.destroy({
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