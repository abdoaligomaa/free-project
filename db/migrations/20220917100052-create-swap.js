'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Swap', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
      },
      hostId: {
        allowNull: false,
        type: Sequelize.STRING,
      },
      guestId: {
        allowNull: false,
        type: Sequelize.STRING,
      },
      checkIn: {
        allowNull: false,
        type: Sequelize.DATE,
      },
      checkOut: {
        allowNull: false,
        type: Sequelize.DATE,
      },
      hostListId: {
        allowNull: false,
        type: Sequelize.INTEGER,
      },
      guestListId: {
        allowNull: false,
        type: Sequelize.INTEGER,
      },
      swapStatus: {
        allowNull: false,
        type: Sequelize.STRING,
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE,
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE,
      },
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('Swap');
  },
};
