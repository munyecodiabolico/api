'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
   
    await queryInterface.createTable('cart_details', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      shoppingCartsId: { 
        type: Sequelize.INTEGER, 
        references: { 
              model: 'shopping_carts',
              key: 'id' 
        }, 
        onUpdate: 'CASCADE', 
        onDelete: 'SET NULL' 
      },
      productsId: { 
        type: Sequelize.INTEGER, 
        references: { 
              model: 'products',
              key: 'id' 
        }, 
        onUpdate: 'CASCADE', 
        onDelete: 'SET NULL' 
      },
      price: {
        allowNull: false,
        type: Sequelize.DECIMAL(6,2)
      },
      measureUnit: {
        allowNull: false,
        type: Sequelize.STRING
      },
      productName: {
        allowNull: false,
        type: Sequelize.STRING
      },
      taxeType: {
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
   
    await queryInterface.dropTable('cart_details');
  }
};

