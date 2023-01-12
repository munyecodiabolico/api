const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
    return sequelize.define('ResizedImage', {
        id: {
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        sourceImagesId: {
            type: DataTypes.INTEGER,
            allowNull: true,
            references: {
                model: 'source_images',
                key: 'id'
            }
        },
        imageConfigurationsId: {
            type: DataTypes.INTEGER,
            allowNull: true,
            references: {
                model: 'image_configurations',
                key: 'id'
            }
        },
        titleText: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        altText: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        path: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        entity: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        entityKey: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        languageAlias: {
            type: DataTypes.STRING(2),
            allowNull: false
        },
        filename: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        content: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        mimeType: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        grid: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        sizeBytes: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        widthPx: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        heightPx: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        quality: {
            type: DataTypes.INTEGER,
            allowNull: false
        }
    }, {
        sequelize,
        tableName: 'resized_images',
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
                name: "sourceImagesId",
                using: "BTREE",
                fields: [
                    { name: "sourceImagesId" },
                ]
            },
            {
                name: "imageConfigurationsId",
                using: "BTREE",
                fields: [
                    { name: "imageConfigurationsId" },
                ]
            },
        ]
    });
};
