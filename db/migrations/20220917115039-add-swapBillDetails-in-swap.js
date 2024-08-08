'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    let transaction = await queryInterface.sequelize.transaction();
    try {
      await queryInterface.addColumn(
        'Swap',
        'swapCountry',
        {
          type: Sequelize.STRING,
          defaultValue: null,
        },
        { transaction },
      );
      await queryInterface.addColumn(
        'Swap',
        'swapDatesSelected',
        {
          type: Sequelize.INTEGER,
          defaultValue: null,
        },
        { transaction },
      );
      await queryInterface.addColumn(
        'Swap',
        'swapStayedNights',
        {
          type: Sequelize.INTEGER,
          defaultValue: null,
        },
        { transaction },
      );
      await queryInterface.addColumn(
        'Swap',
        'swapIsSpecialPriceAssigned',
        {
          type: Sequelize.BOOLEAN,
          defaultValue: null,
        },
        { transaction },
      );
      await queryInterface.addColumn(
        'Swap',
        'swapIsAverage',
        {
          type: Sequelize.STRING,
          defaultValue: null,
        },
        { transaction },
      );
      await queryInterface.addColumn(
        'Swap',
        'swapCurrency',
        {
          type: Sequelize.STRING,
          defaultValue: null,
        },
        { transaction },
      );
      await queryInterface.addColumn(
        'Swap',
        'swapDayDifference',
        {
          type: Sequelize.INTEGER,
          defaultValue: null,
        },
        { transaction },
      );
      await queryInterface.addColumn(
        'Swap',
        'swapIsDayTotal',
        {
          type: Sequelize.STRING,
          defaultValue: null,
        },
        { transaction },
      );
      await queryInterface.addColumn(
        'Swap',
        'swapDiscount',
        {
          type: Sequelize.STRING,
          defaultValue: null,
        },
        { transaction },
      );
      await queryInterface.addColumn(
        'Swap',
        'swapDiscountType',
        {
          type: Sequelize.STRING,
          defaultValue: null,
        },
        { transaction },
      );
      await queryInterface.addColumn(
        'Swap',
        'swapCleaningPrice',
        {
          type: Sequelize.STRING,
          defaultValue: null,
        },
        { transaction },
      );
      await queryInterface.addColumn(
        'Swap',
        'swapServiceFee',
        {
          type: Sequelize.STRING,
          defaultValue: null,
        },
        { transaction },
      );
      await queryInterface.addColumn(
        'Swap',
        'swapTotal',
        {
          type: Sequelize.STRING,
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
      await queryInterface.removeColumn('Swap', 'swapCountry', {
        transaction,
      });
      await queryInterface.removeColumn('Swap', 'swapDatesSelected', {
        transaction,
      });
      await queryInterface.removeColumn('Swap', 'swapStayedNights', {
        transaction,
      });
      await queryInterface.removeColumn('Swap', 'swapIsSpecialPriceAssigned', {
        transaction,
      });
      await queryInterface.removeColumn('Swap', 'swapIsAverage', {
        transaction,
      });
      await queryInterface.removeColumn('Swap', 'swapCurrency', {
        transaction,
      });
      await queryInterface.removeColumn('Swap', 'swapDayDifference', {
        transaction,
      });
      await queryInterface.removeColumn('Swap', 'swapIsDayTotal', {
        transaction,
      });
      await queryInterface.removeColumn('Swap', 'swapDiscount', {
        transaction,
      });
      await queryInterface.removeColumn('Swap', 'swapDiscountType', {
        transaction,
      });
      await queryInterface.removeColumn('Swap', 'swapCleaningPrice', {
        transaction,
      });
      await queryInterface.removeColumn('Swap', 'swapServiceFee', {
        transaction,
      });
      await queryInterface.removeColumn('Swap', 'swapTotal', {
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
