'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
   
    await queryInterface.createTable('image_configurations', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      entity: {
        allowNull: false,
        type: Sequelize.STRING
      },
      directory: {
        allowNull: false,
        type: Sequelize.STRING
      },
      type: {
        allowNull: false,
        type: Sequelize.STRING
      },
      content: {
        allowNull: false,
        type: Sequelize.STRING
      },
      grid: {
        allowNull: false,
        type: Sequelize.STRING
      },
      contentAccepted: {
        allowNull: false,
        type: Sequelize.STRING
      },
      extensionConversion: {
        allowNull: false,
        type: Sequelize.STRING(4)
      },
      widthPx: {
        allowNull: false,
        type: Sequelize.INTEGER(4)
      },
      heightPx: {
        allowNull: false,
        type: Sequelize.INTEGER(4)
      },
      quality: {
        allowNull: false,
        type: Sequelize.INTEGER(3)
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
   
    await queryInterface.dropTable('image_configurations');
  }
};

