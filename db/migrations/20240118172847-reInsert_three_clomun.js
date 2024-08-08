'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.addColumn('Listing', 'additionalTitle', {
      type: Sequelize.STRING,
      allowNull: true,
    });

    await queryInterface.addColumn('Listing', 'additionalDescription', {
      type: Sequelize.TEXT,
      allowNull: true,
    });

    await queryInterface.addColumn('Listing', 'additionalCoverPhoto', {
      type: Sequelize.INTEGER,
      allowNull: true,
    });   
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeColumn('Listing', 'additionalTitle');
    await queryInterface.removeColumn('Listing', 'additionalDescription');
    await queryInterface.removeColumn('Listing', 'additionalCoverPhoto');

  },
  
};
