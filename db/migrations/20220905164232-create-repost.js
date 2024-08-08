'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Repost', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
      },
      start_date: {
        type: Sequelize.STRING,
      },
      end_date: {
        type: Sequelize.STRING,
      },
      new_night_price: {
        type: Sequelize.FLOAT,
      },
      repost_transaction_id: {
        type: Sequelize.INTEGER,
      },
      listing_id: {
        type: Sequelize.INTEGER,
      },
      payment_status: {
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
    return queryInterface.dropTable('Repost');
  },
};
