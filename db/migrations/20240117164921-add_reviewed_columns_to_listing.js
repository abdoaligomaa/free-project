'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.addColumn('Listing', 'reviewed', {
      type: Sequelize.BOOLEAN,
      allowNull: false,
      defaultValue: false, // Set a default value if needed
    });
  },


  down:  async (queryInterface, Sequelize) => {
    await queryInterface.removeColumn('Listing', 'reviewed');
  },
};
