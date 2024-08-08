'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    /*
      Add altering commands here.
      Return a promise to correctly handle asynchronicity.

      Example:
      return queryInterface.createTable('users', { id: Sequelize.INTEGER });
    */
    // make repost_id nullable in table repost_shares
    return queryInterface.changeColumn(
      'Repost_Share',
      'repost_id',
      {
        type: Sequelize.INTEGER,
        allowNull: true,
      },
    );
  },

  down: (queryInterface, Sequelize) => {
    /*
      Add reverting commands here.
      Return a promise to correctly handle asynchronicity.

      Example:
      return queryInterface.dropTable('users');
    */
    return queryInterface.changeColumn(
      'Repost_Share',
      'repost_id',
      {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
    );
  }
};
