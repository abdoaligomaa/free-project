'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.addColumn('Coupon', 'listingId', {
      type: Sequelize.INTEGER,
      allowNull: true, // or false, depending on your requirements
      defaultValue: null,
    });
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeColumn('Coupon', 'listingId');
  }
};
