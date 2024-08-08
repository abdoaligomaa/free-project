'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('WalletTransaction', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      isWithdrawal: {
        type: Sequelize.BOOLEAN
      },
      reservationId: {
        type: Sequelize.INTEGER
      },
      balance: {
        type: Sequelize.FLOAT
      },
      amount: {
        type: Sequelize.FLOAT
      },
      walletId: {
        type: Sequelize.INTEGER
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('WalletTransaction');
  }
};