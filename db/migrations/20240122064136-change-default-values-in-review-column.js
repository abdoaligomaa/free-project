'use strict';

module.exports = {
  up:  async (queryInterface, Sequelize) => {
    // Drop the 'review' column
    // await queryInterface.removeColumn('ListPhotos', 'review');

    // Add the 'review' column with custom values
    await queryInterface.addColumn('ListPhotos', 'review', {
      type: Sequelize.BOOLEAN,
      allowNull: false,
      defaultValue: false, 
    });
  },

  down:  async (queryInterface, Sequelize) => {
    // Revert the changes made in the up migration
    await queryInterface.removeColumn('ListPhotos', 'review');
    await queryInterface.addColumn('ListPhotos', 'review', {
      type: Sequelize.BOOLEAN,
      allowNull: true,
    });
  },
  
};
