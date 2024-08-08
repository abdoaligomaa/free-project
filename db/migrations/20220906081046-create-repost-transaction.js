'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Reposts_Transaction', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
      },
      repost_id: {
        type: Sequelize.INTEGER,
      },
      payer_email: {
        type: Sequelize.STRING,
      },
      payer_id: {
        type: Sequelize.STRING,
      },
      receiver_email: {
        type: Sequelize.STRING,
      },
      receiver_id: {
        type: Sequelize.STRING,
      },
      transaction_id: {
        type: Sequelize.STRING,
      },
      total: {
        type: Sequelize.FLOAT,
      },
      transaction_fee: {
        type: Sequelize.FLOAT,
      },
      currency: {
        type: Sequelize.STRING,
      },
      ipn_track_id: {
        type: Sequelize.STRING,
      },
      payment_type: {
        type: Sequelize.STRING,
      },
      payment_method_id: {
        type: Sequelize.INTEGER,
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
    return queryInterface.dropTable('Reposts_Transaction');
  },
};
