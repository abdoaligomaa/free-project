'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Repost_Shares', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
      },
      reservation_id: {
        type: Sequelize.INTEGER,
      },
      transaction_id: {
        type: Sequelize.INTEGER,
      },
      amount: {
        type: Sequelize.FLOAT,
      },
      host_id: {
        type: Sequelize.STRING,
      },
      start_date: {
        type: Sequelize.STRING,
      },
      end_date: {
        type: Sequelize.STRING,
      },
      repost_id: {
        type: Sequelize.INTEGER,
      },
      is_paid_out: {
        type: Sequelize.BOOLEAN,
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
    return queryInterface.dropTable('Repost_Shares');
  },
};
