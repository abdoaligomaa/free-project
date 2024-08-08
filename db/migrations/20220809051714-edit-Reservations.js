'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    let transaction = await queryInterface.sequelize.transaction();
    try {
      await queryInterface.addColumn(
        "Reservation",
        "isPublic",
        {
          type: Sequelize.BOOLEAN,
          defaultValue: true

        },
        { transaction },
      );
      await queryInterface.addColumn(
        "Reservation",
        "splitAndShare",
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
      await queryInterface.removeColumn("Reservation", "isPublic", { transaction });
      await queryInterface.removeColumn("Reservation", "splitAndShare", { transaction });
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