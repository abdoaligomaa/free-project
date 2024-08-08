'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.sequelize.transaction(t => {
      return Promise.all([
        queryInterface.addColumn(
          'ListingData',
          'minNightRepost',
          { type: Sequelize.DataTypes.INTEGER },
          { transaction: t },
        ),

        queryInterface.addColumn(
          'ListingData',
          'maxNightRepost',
          { type: Sequelize.DataTypes.INTEGER },
          { transaction: t },
        ),

        queryInterface.addColumn(
          'ListingData',
          'minNightSwap',
          { type: Sequelize.DataTypes.INTEGER },
          { transaction: t },
        ),

        queryInterface.addColumn(
          'ListingData',
          'maxNightSwap',
          { type: Sequelize.DataTypes.INTEGER },
          { transaction: t },
        ),

        queryInterface.bulkInsert('ListSettingsTypes', [
          {
            typeName: 'minNightRepost',
            fieldType: 'numberType',
            step: 3,
            isEnable: true,
            typeLabel: 'Minimum Repost Nights',
            isMultiValue: false,
          },
          {
            typeName: 'maxNightRepost',
            fieldType: 'numberType',
            step: 3,
            isEnable: true,
            typeLabel: 'Maximum Repost Nights',
            isMultiValue: false,
          },
          {
            typeName: 'minNightSwap',
            fieldType: 'numberType',
            step: 3,
            isEnable: true,
            typeLabel: 'Minimum Swap Nights',
            isMultiValue: false,
          },
          {
            typeName: 'maxNightSwap',
            fieldType: 'numberType',
            step: 3,
            isEnable: true,
            typeLabel: 'Maximum Swap Nights',
            isMultiValue: false,
          },
        ]),

        queryInterface.bulkInsert('ListSettings', [
          {
            typeId: 20,
            itemName: 'repost min nights',
            otherItemName: 'repost min nights',
            startValue: 0,
            endValue: 100,
            isEnable: true,
          },
          {
            typeId: 21,
            itemName: 'repost max nights',
            otherItemName: 'repost max nights',
            startValue: 0,
            endValue: 100,
            isEnable: true,
          },
          {
            typeId: 22,
            itemName: 'swap min nights',
            otherItemName: 'swap min nights',
            startValue: 0,
            endValue: 100,
            isEnable: true,
          },
          {
            typeId: 23,
            itemName: 'swap max nights',
            otherItemName: 'swap max nights',
            startValue: 0,
            endValue: 100,
            isEnable: true,
          },
        ]),
      ]);
    });
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.sequelize.transaction(t => {
      return Promise.all([
        queryInterface.removeColumn('ListingData', 'minNightRepost', {
          transaction: t,
        }),

        queryInterface.removeColumn('ListingData', 'maxNightRepost', {
          transaction: t,
        }),

        queryInterface.removeColumn('ListingData', 'minNightSwap', {
          transaction: t,
        }),

        queryInterface.removeColumn('ListingData', 'maxNightSwap', {
          transaction: t,
        }),
      ]);
    });
  },
};
