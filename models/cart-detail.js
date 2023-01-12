const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
    return sequelize.define('CartDetail', {
        id: {
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        shoppingCartsId: {
            type: DataTypes.INTEGER,
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo SHOPPINGCARTID es OBLIGATORIO."
                },
                notEmpty:{
                    msg: "El campo SHOPPINGCARTID no puede estar vacío."
                },
                isInt:{
                    msg: "El campo SHOPPINGCARTSID tiene que ser un entero."
                }
            },
            references: {
                model: 'shopping_carts',
                key: 'id'
            }
        },
        productsId: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'products',
                key: 'id'
            },
            validate: {
                notNull: {
                    msg: "El campo PRODUCTID es OBLIGATORIO."
                },
                notEmpty:{
                    msg: "El campo PRODUCTID no puede estar vacío."
                },
                isInt:{
                    msg: "El campo PRODUCTID tiene que ser un entero."
                }
            }
        },
        price: {
            type: DataTypes.DECIMAL(6,2),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo PRECIO es OBLIGATORIO."
                },
                notEmpty:{
                    msg: "El campo PRECIO no puede estar vacío."
                },
                isDecimal: {
                    msg:"El campo precio puede tener 6 numeros y dos decimales"
                }
            }
        },
        measureUnit: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo UNIDAD DE MEDIDA es OBLIGATORIO."
                },
                notEmpty:{
                    msg: "El campo UNIDAD DE MEDIDA no puede estar vacío."
                }
            }
        },
        productName: {
            type: DataTypes.STRING(255),
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo NOMBRE DEL PRODUCTO es OBLIGATORIO."
                },
                notEmpty:{
                    msg: "El campo NOMBRE DEL PRODUCTO no puede estar vacío."
                }
            }
        },
        taxeType: {
            type: DataTypes.INTEGER,
            allowNull: false,
            validate: {
                notNull: {
                    msg: "El campo TIPO DE IVA es OBLIGATORIO."
                },
                notEmpty:{
                    msg: "El campo TIPO DE IVA no puede estar vacío."
                },
                isInt:{
                    msg: "El campo TIPO DE IVA tiene que ser un entero."
                }
            }
        }
    }, {
        sequelize,
        tableName: 'cart_details',
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
                name: "productsId",
                using: "BTREE",
                fields: [
                    { name: "productsId" },
                ]
            },
        ]
    });
};
