// Este código es un modelo de Sequelize, que se utiliza para definir la estructura de una tabla en una base de datos. En este caso, la tabla se llama "Business" y tiene varias columnas con diferentes tipos de datos, como INTEGER, STRING y TEXT. Además, cada columna tiene un conjunto de restricciones y validaciones, como "allowNull: false" y "isEmail", que se utilizan para asegurar la integridad de los datos. Por ejemplo, la columna "email" tiene una restricción "isEmail" que valida que el valor de la columna sea una dirección de correo electrónico válida.

// La tabla también tiene columnas para "createdAt", "updatedAt" y "deletedAt" que son campos automáticos generados por Sequelize y se usan para registrar la fecha y hora en que se creó, actualizó o eliminó un registro en la tabla.

// En resumen, este código es una definición de una tabla Business con un conjunto de columnas y restricciones específicas que se utilizarán para asegurar la integridad de los datos en la tabla.





const Sequelize = require('sequelize');
module.exports = function (sequelize, DataTypes) {
    return sequelize.define('Book', {

        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            type: DataTypes.INTEGER,
          },

        title: {
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo TITULO es OBLIGATORIO."
                },
                notEmpty: {
                    msg: "El campo TITULO no puede estar vacío."
                }
            }
        },
        author: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo AUTOR es OBLIGATORIO."
                },
                notEmpty: {
                    msg: "El campo AUTOR no puede estar vacío."
                }
            }
        },
        description: {
            type: DataTypes.TEXT,
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo DESCRIPCION es OBLIGATORIO."
                },
                notEmpty: {
                    msg: "El campo DESCRIPCION no puede estar vacío."
                }
            }
        },
        isbn: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo ISBN es OBLIGATORIO."
                },
                notEmpty: {
                    msg: "El campo ISBN no puede estar vacío."
                }
            }
        },
        pageCount: {
            type: DataTypes.INTEGER,
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo NRO. PAGINAS es OBLIGATORIO."
                },
                notEmpty: {
                    msg: "El campo NRO. PAGINAS no puede estar vacío."
                },
                is: {
                    args: [/^\d+$/g],
                    msg: "El campo NRO. PAGINAS debe ser un NUMERO"
                }
            }
        },
        publishedDate: {
            type: DataTypes.DATEONLY,
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo FECHA PUBLICACION es OBLIGATORIO."
                },
                notEmpty: {
                    msg: "El campo FECHA PUBLICACION no puede estar vacío."
                }
            }
        }
    }, {
        sequelize,
        tableName: 'books',
        timestamps: true,
        paranoid: true,
        indexes: [
            {
                name: "PRIMARY",
                unique: true,
                using: "BTREE",
                fields: [
                    { name: "id" },
                ]
            },
        ]
    });
};
