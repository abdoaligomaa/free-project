'use strict';

module.exports = {
  up:async (queryInterface, Sequelize) => {
    await queryInterface.addColumn('Coupon', 'ownerId', {
      type: Sequelize.UUID,
      allowNull: true, // Set to false if ownerId is required
    });
  },

  down:  async (queryInterface, Sequelize) => {
    await queryInterface.removeColumn('Coupon', 'ownerId');
  },
};
