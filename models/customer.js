const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
    return sequelize.define('Customer', {
        id: {
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        name: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo NOMBRE es obligatorio."
                },
                notEmpty:{
                    msg: "El campo NOMBRE no puede estar vacío."
                }
            }
        },
        surname: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo APELLIDO es obligatorio."
                },
                notEmpty:{
                    msg: "El campo APELLIDO no puede estar vacío."
                }
            }
        },
        phone: {
            type: DataTypes.INTEGER,
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo TELEFONO es obligatorio."
                },
                notEmpty:{
                    msg: "El campo TELEFONO no puede estar vacío."
                },
                is: {
                    args: [/^\d{9}$/g],
                    msg: "El campo TELEFONO debe estar compuesto por 9 numeros."
                }
            }
        },
        email: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo EMAIL es obligatorio."
                },
                notEmpty:{
                    msg: "El campo EMAIL no puede estar vacío."
                },
                isEmail: {
                    msg:"El campo EMAIL no tiene el formato de correo electrónico."
                }
            }
        },
        city: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo CIUDAD es obligatorio."
                },
                notEmpty:{
                    msg: "El campo CIUDAD no puede estar vacío."
                }
            }

        },
        postalCode: {
            type: DataTypes.INTEGER,
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo CODIGO POSTAL es obligatorio."
                },
                notEmpty:{
                    msg: "El campo CODIGO POSTAL no puede estar vacío."
                },
                is: {
                    args: [/^\d{5}$/g],
                    msg: "El CODIGO POSTAL debe estar compuesto de 5 numeros."
                }
            }

        },
        address: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo DIRECCION es obligatorio."
                },
                notEmpty:{
                    msg: "El campo DIRECCION no puede estar vacío."
                }
            }
        },
        valid: {
            type: DataTypes.BOOLEAN,
            allowNull: false,
            defaultValue: true,
            validate: {
                isBoolean:{
                    msg: "El campo VALID debe ser un valor BOOLEANO."
                }
            }
        }
    }, {
        sequelize,
        tableName: 'customers',
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
