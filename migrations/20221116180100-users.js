// Este código es una migración de Sequelize, una herramienta de ORM (Mapeo de objetos a relacionales) para Node.js. La migración se utiliza para crear y modificar tablas en una base de datos.

// La migración tiene dos funciones principales: up y down. La función up se ejecuta cuando se ejecuta el comando "sequelize db:migrate" y se utiliza para crear una nueva tabla en la base de datos.

// La función up utiliza el método "createTable" del objeto queryInterface para crear una tabla llamada "users" con los siguientes campos:

// id: un entero que no puede ser nulo, se autoincrementa y es la clave primaria.
// name: una cadena que no puede ser nula.
// email: una cadena que no puede ser nula y es única.
// password: una cadena.
// createdAt: una fecha que no puede ser nula
// updatedAt: una fecha que no puede ser nula
// deletedAt: una fecha.
// La función down se ejecuta cuando se ejecuta el comando "sequelize db:migrate:undo" y se utiliza para eliminar la tabla "users" de la base de datos utilizando el método "dropTable" del objeto queryInterface.
// En resumen, esta migración se utiliza para crear una tabla de usuarios en la base de datos con los campos especificados y también proporciona una forma de eliminar esa tabla en caso de ser necesario.

// Una vez que se ejecuta la migración, las tablas de usuarios se crearán en la base de datos con las columnas especificadas en la migración, permitiendo almacenar información de usuarios en la base de datos.
// También se puede utilizar para modificar la estructura de la tabla existente, agregando o eliminando columnas o modificando las restricciones existentes.
// Además, se puede utilizar para hacer cambios en las tablas existentes, como agregar o quitar restricciones en las columnas, o cambiar el tipo de datos de una columna.
// En general, las migraciones son una herramienta útil para administrar el esquema de la base de datos y asegurar la consistencia de los datos en un proyecto de desarrollo.

'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {

  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('users', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      name: {
        allowNull: false,
        type: Sequelize.STRING
      },
      email: {
        unique: true,
        allowNull: false,
        type: Sequelize.STRING
      },
      password: {
        type: Sequelize.STRING
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      deletedAt: {
        type: Sequelize.DATE
      }
    });
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('users');
  }
};

