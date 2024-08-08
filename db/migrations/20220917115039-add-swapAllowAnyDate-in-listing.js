'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    let transaction = await queryInterface.sequelize.transaction();
    try {
      await queryInterface.addColumn(
        'Listing',
        'swapAllowAnyDate',
        {
          type: Sequelize.BOOLEAN,
          defaultValue: true,
        },
        { transaction },
      );

      await transaction.commit();
      return Promise.resolve();
    } catch (err) {
      if (transaction) {
        await transaction.rollback();
      }
      return Promise.reject(err);
    }
  },

  down: async (queryInterface, Sequelize) => {
    let transaction = await queryInterface.sequelize.transaction();
    try {
      await queryInterface.removeColumn('Listing', 'swapAllowAnyDate', {
        transaction,
      });
      await transaction.commit();
      return Promise.resolve();
    } catch (err) {
      if (transaction) {
        await transaction.rollback();
      }
      return Promise.reject(err);
    }
  },
};
