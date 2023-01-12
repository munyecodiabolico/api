'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
   
    await queryInterface.createTable('resized_images', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      sourceImagesId: { 
        type: Sequelize.INTEGER, 
        references: { 
              model: 'source_images', 
              key: 'id' 
        }, 
        onUpdate: 'CASCADE', 
        onDelete: 'SET NULL' 
      },
      imageConfigurationsId: { 
        type: Sequelize.INTEGER, 
        references: { 
              model: 'image_configurations', 
              key: 'id' 
        }, 
        onUpdate: 'CASCADE', 
        onDelete: 'SET NULL' 
      },
      titleText: {
        allowNull: false,
        type: Sequelize.STRING
      },
      altText: {
        allowNull: false,
        type: Sequelize.STRING
      },
      path: {
        allowNull: false,
        type: Sequelize.STRING
      },
      entity: {
        allowNull: false,
        type: Sequelize.STRING
      },
      entityKey: {
        allowNull: false,
        type: Sequelize.INTEGER
      },
      languageAlias: {
        allowNull: false,
        type: Sequelize.STRING(2)
      },
      filename: {
        allowNull: false,
        type: Sequelize.STRING
      },
      content: {
        allowNull: false,
        type: Sequelize.STRING
      },
      mimeType: {
        allowNull: false,
        type: Sequelize.STRING
      },
      grid: {
        allowNull: false,
        type: Sequelize.STRING
      },
      sizeBytes: {
        allowNull: false,
        type: Sequelize.INTEGER
      },
      widthPx: {
        allowNull: false,
        type: Sequelize.INTEGER
      },
      heightPx: {
        allowNull: false,
        type: Sequelize.INTEGER
      },
      quality: {
        allowNull: false,
        type: Sequelize.INTEGER
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      deletedAt: {
        allowNull: true,
        type: Sequelize.DATE
      }
    });
  },

  async down (queryInterface, Sequelize) {
   
    await queryInterface.dropTable('resized_images');
  }
};

