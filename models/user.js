const Sequelize = require('sequelize');
const useBcrypt = require('sequelize-bcrypt');

module.exports = function(sequelize, DataTypes) {
    const User = sequelize.define('User', {
        id: {
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        name: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validator: {
                notEmpty: {
                    msg: 'Por favor, rellena el campo "Nombre".'
                },
                notNull: {
                    msg: 'Por favor, rellena el campo "Nombre".'
                }
            }
        },
        email: {
            type: DataTypes.STRING(255),
            allowNull: false,
            unique: {
                args: true,
                msg: 'Ya existe un usuario con ese correo electrónico.'
            },
            validator: {
                notEmpty: {
                    msg: 'Por favor, rellena el campo "Email".'
                },
                notNull: {
                    msg: 'Por favor, rellena el campo "Email".'
                },
                isEmail: {
                    msg: 'Por favor, rellena el campo "Email" con un email válido.'
                }
            }
        },
        password: {
            type: DataTypes.STRING(255),
            allowNull: true,
            validator: {
                notEmpty: {
                    msg: 'Por favor, rellena el campo "Contraseña".'
                },
                notNull: {
                    msg: 'Por favor, rellena el campo "Contraseña".'
                }
            }
        }
    }, {
        sequelize,
        tableName: 'users',
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
                name: "email",
                unique: true,
                using: "BTREE",
                fields: [
                    { name: "email" },
                ]
            },
        ]
    });

    useBcrypt(User);

    return User;
};