const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
    return sequelize.define('Refund', {
        id: {
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        shoppingCartsId: {
            type: DataTypes.INTEGER,
            allowNull: true,
            references: {
                model: 'shopping_carts',
                key: 'id'
            }
        },
        customersId: {
            type: DataTypes.INTEGER,
            allowNull: true,
            references: {
                model: 'customers',
                key: 'id'
            }
        },
        paymentMethodsId: {
            type: DataTypes.INTEGER,
            allowNull: true,
            references: {
                model: 'payment_methods',
                key: 'id'
            }
        },
        totalPrice: {
            type: DataTypes.DECIMAL(10,2),
            allowNull: false
        },
        basePriceTotal: {
            type: DataTypes.DECIMAL(10,2),
            allowNull: false
        },
        ivaPriceTotal: {
            type: DataTypes.DECIMAL(10,2),
            allowNull: false
        },
        dateEmision: {
            type: DataTypes.DATEONLY,
            allowNull: false
        },
        hourEmision: {
            type: DataTypes.TIME,
            allowNull: false
        }
    }, {
        sequelize,
        tableName: 'refunds',
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
                name: "shoppingCartsId",
                using: "BTREE",
                fields: [
                    { name: "shoppingCartsId" },
                ]
            },
            {
                name: "customersId",
                using: "BTREE",
                fields: [
                    { name: "customersId" },
                ]
            },
            {
                name: "paymentMethodsId",
                using: "BTREE",
                fields: [
                    { name: "paymentMethodsId" },
                ]
            },
        ]
    });
};
