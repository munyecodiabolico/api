const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
    return sequelize.define('RefundDetail', {
        id: {
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        refundsId: {
            type: DataTypes.INTEGER,
            allowNull: true,
            references: {
                model: 'refunds',
                key: 'id'
            }
        },
        productsId: {
            type: DataTypes.INTEGER,
            allowNull: true,
            references: {
                model: 'products',
                key: 'id'
            }
        },
        amount: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        price: {
            type: DataTypes.DECIMAL(6,2),
            allowNull: false
        },
        measureUnit: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        productName: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        taxesType: {
            type: DataTypes.INTEGER,
            allowNull: false
        }
    }, {
        sequelize,
        tableName: 'refund_details',
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
                name: "refundsId",
                using: "BTREE",
                fields: [
                    { name: "refundsId" },
                ]
            },
            {
                name: "productsId",
                using: "BTREE",
                fields: [
                    { name: "productsId" },
                ]
            },
        ]
    });
};
