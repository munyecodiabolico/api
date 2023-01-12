const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
    return sequelize.define('ShoppingCart', {
        id: {
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        customersId: {
            type: DataTypes.INTEGER,
            allowNull: true,
            references: {
                model: 'customers',
                key: 'id'
            }
        },
        fingerprintsId: {
            type: DataTypes.INTEGER,
            allowNull: true,
            references: {
                model: 'fingerprints',
                key: 'id'
            }
        }
    }, {
        sequelize,
        tableName: 'shopping_carts',
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
                name: "customersId",
                using: "BTREE",
                fields: [
                    { name: "customersId" },
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
