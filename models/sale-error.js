const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
    return sequelize.define('SaleError', {
        id: {
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        paymentMethodsId: {
            type: DataTypes.INTEGER,
            allowNull: true,
            references: {
                model: 'payment_methods',
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
        shoppingCartsId: {
            type: DataTypes.INTEGER,
            allowNull: true,
            references: {
                model: 'shopping_carts',
                key: 'id'
            }
        },
        errorCode: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        errorMessage: {
            type: DataTypes.STRING(255),
            allowNull: false
        }
    }, {
        sequelize,
        tableName: 'sale_errors',
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
                name: "paymentMethodsId",
                using: "BTREE",
                fields: [
                    { name: "paymentMethodsId" },
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
                name: "shoppingCartsId",
                using: "BTREE",
                fields: [
                    { name: "shoppingCartsId" },
                ]
            },
        ]
    });
};
