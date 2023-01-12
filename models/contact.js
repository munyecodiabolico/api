const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
    return sequelize.define('Contact', {
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
                    msg: "El campo TELEFONO debe tener 9 numeros."
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
        message: {
            type: DataTypes.TEXT,
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo MESSAGE es obligatorio."
                },
                notEmpty:{
                    msg: "El campo MESSAGE no puede estar vacío."
                },
                len: {
                    args: [30,250],
                    msg:"El campo MESSAGE debe estar entre 30 y 250 caracteres."
                }
            }
        },
        fingerprintsId: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'fingerprints',
                key: 'id'
            },
            validate: {
                notNull: {
                    msg: "El campo FINGERPRINTSID es obligatorio."
                },
                notEmpty:{
                    msg: "El campo FINGERPRINTSID no puede estar vacío."
                },
                isInt:{
                    msg: "El campo FINGERPRINTSID tiene que ser un entero."
                }
            }
        }
    }, {
        sequelize,
        tableName: 'contacts',
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
            {
                name: "fingerprintsId",
                using: "BTREE",
                fields: [
                    { name: "fingerprintsId" },
                ]
            },
        ]
    });
};

