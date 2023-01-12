'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
   
    await queryInterface.createTable('refunds', {
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
      customersId: { 
        type: Sequelize.INTEGER, 
        references: { 
              model: 'customers',
              key: 'id' 
        }, 
        onUpdate: 'CASCADE', 
        onDelete: 'SET NULL' 
      },
      paymentMethodsId: { 
        type: Sequelize.INTEGER, 
        references: { 
              model: 'payment_methods',
              key: 'id' 
        }, 
        onUpdate: 'CASCADE', 
        onDelete: 'SET NULL' 
      },
      totalPrice: {
        allowNull: false,
        type: Sequelize.DECIMAL(10,2)
      },
      basePriceTotal: {
        allowNull: false,
        type: Sequelize.DECIMAL(10,2)
      },
      ivaPriceTotal: {
        allowNull: false,
        type: Sequelize.DECIMAL(10,2)
      },
      dateEmision: {
        allowNull: false,
        type: Sequelize.DATEONLY
      },
      hourEmision: {
        allowNull: false,
        type: Sequelize.TIME
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
   
    await queryInterface.dropTable('refunds');
  }
};
