const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
    return sequelize.define('Email', {
        id: {
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true
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
    }, {
        sequelize,
        tableName: 'emails',
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
            }
        ]
    });
};