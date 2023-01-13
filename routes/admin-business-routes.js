// Este código es un archivo de rutas para una aplicación de servidor utilizando Express.js. El objetivo es establecer rutas para las operaciones CRUD (crear, leer, actualizar y borrar) en una tabla de negocios en una base de datos. Utiliza el middleware auth-jwt para verificar que el usuario que realiza la solicitud tiene un token válido antes de permitirles acceder a estas rutas. Cada una de las operaciones CRUD está asociada con una función específica del controlador de negocios.

// Por ejemplo, cuando un cliente realiza una solicitud POST a la ruta "/api/admin/businesses", el middleware auth-jwt se ejecuta primero para verificar que el cliente ha proporcionado un token válido en su solicitud. Si el token es válido, la solicitud se dirige al controlador de negocios, en particular la función "create" para crear un nuevo negocio en la base de datos. Similarmente, una solicitud GET a la misma ruta se dirigirá a la función "findAll" del controlador para recuperar todos los negocios de la base de datos, mientras que una solicitud DELETE a la ruta "/api/admin/businesses/:id" se dirigirá a la función "delete" del controlador para eliminar el negocio con ese ID específico de la base de datos.





module.exports = app => {

  const router = require("express").Router();
  const controller = require("../controllers/admin/business-controller.js");
  const authJwt = require("../middlewares/auth-jwt.js");

  app.use(function (req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "Authorization, Origin, Content-Type, Accept"
    );
    next();
  });

  router.post("/", [authJwt.verifyUserToken], controller.create);
  router.get("/", [authJwt.verifyUserToken], controller.findAll);
  router.get("/:id", [authJwt.verifyUserToken], controller.findOne);
  router.put("/:id", [authJwt.verifyUserToken], controller.update);
  router.delete("/:id", [authJwt.verifyUserToken], controller.delete);

  app.use('/api/admin/businesses', router);
};