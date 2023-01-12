const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
    return sequelize.define('Business', {
        id: {
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        company: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo COMPAÑIA es OBLIGATORIO."
                },
                notEmpty:{
                    msg: "El campo COMPAÑIA no puede estar vacío."
                }
            }
        },
        street: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo DIRECCION es OBLIGATORIO."
                },
                notEmpty:{
                    msg: "El campo DIRECCION no puede estar vacío."
                }
            }
        },
        postalCode: {
            type: DataTypes.STRING(5),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo CODIGO POSTAL es OBLIGATORIO."
                },
                notEmpty:{
                    msg: "El campo CODIGO POSTAL no puede estar vacío."
                },
                is: {
                    args: [/^\d{5}$/g],
                    msg: "El CÓDIGO POSTAL debe estar compuesto de 5 numeros."
                }
            }
        },
        city: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo CIUDAD es OBLIGATORIO."
                },
                notEmpty:{
                    msg: "El campo CIUDAD no puede estar vacío."
                }
            }
            
        },
        country: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo PAIS es OBLIGATORIO."
                },
                notEmpty:{
                    msg: "El campo PAIS no puede estar vacío."
                }
            }
        },
        phone: {
            type: DataTypes.INTEGER,
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo TELEFONO es OBLIGATORIO."
                },
                notEmpty:{
                    msg: "El campo TELEFONO no puede estar vacío."
                },
                is: {
                    args: [/^\d{9}$/g],
                    msg: "El campo TELEFONO DEBE COMPONERSE DE 9 NUMEROS."
                }
            }
        },
        email: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo EMAIL es OBLIGATORIO."
                },
                notEmpty:{
                    msg: "El campo EMAIL no puede estar vacío."
                },
                isEmail: {
                    msg:"El campo EMAIL no tiene el formato de correo electrónico."
                }
            }
        },
        timeTable: {
            type: DataTypes.TEXT,
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo HORARIO es OBLIGATORIO."
                },
                notEmpty:{
                    msg: "El campo HORARIO no puede estar vacío."
                }
            }
        },
        opening: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo ABIERTO es OBLIGATORIO."
                },
                notEmpty:{
                    msg: "El campo ABIERTO no puede estar vacío."
                }
            }
        },
        cif: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo CIF no puede estar vacío."
                },
                notEmpty:{
                    msg: "El campo CIF no puede estar vacío."
                },
                is: {
                    args: [/^[0-9]{8}[A-Z]$/g],
                    msg: "El CIF debe tener 9 numeros y una letra."
                }
            }
        }
    }, {
        sequelize,
        tableName: 'businesses',
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
