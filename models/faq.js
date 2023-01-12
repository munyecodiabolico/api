const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
    return sequelize.define('Faq', {
        id: {
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        question: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo PREGUNTA es obligatorio."
                },
                notEmpty:{
                    msg: "El campo PREGUNTA no puede estar vacío."
                }
            }
        },
        answer: {
            type: DataTypes.TEXT,
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo ANSWER es obligatorio."
                },
                notEmpty:{
                    msg: "El campo ANSWER no puede estar vacío."
                }
            }
        }
    }, {
        sequelize,
        tableName: 'faqs',
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

