'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
   
    await queryInterface.createTable('images', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
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
      originalFilename: {
        allowNull: false,
        type: Sequelize.STRING
      },
      resizedFilename: {
        allowNull: false,
        type: Sequelize.STRING
      },
      entity: {
        allowNull: false,
        type: Sequelize.STRING
      },
      entityId: {
        allowNull: false,
        type: Sequelize.INTEGER
      },
      sizeBytes: {
        allowNull: false,
        type: Sequelize.INTEGER
      },
      mediaQuery: {
        allowNull: false,
        type: Sequelize.STRING
      },
      name: {
        allowNull: false,
        type: Sequelize.STRING
      },
      languageAlias: {
        allowNull: false,
        type: Sequelize.STRING
      },
      latency: {
        allowNull: false,
        type: Sequelize.INTEGER
      },
      titleText: {
        allowNull: false,
        type: Sequelize.STRING
      },
      altText: {
        allowNull: false,
        type: Sequelize.STRING
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

