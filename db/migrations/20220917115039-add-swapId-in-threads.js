'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    let transaction = await queryInterface.sequelize.transaction();
    try {
      await queryInterface.addColumn(
        'Threads',
        'swapId',
        {
          type: Sequelize.INTEGER,
          defaultValue: null,
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
      await queryInterface.removeColumn('Threads', 'swapId', {
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
