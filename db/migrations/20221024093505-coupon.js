'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    let transaction = await queryInterface.sequelize.transaction();
    try {
      await queryInterface.createTable(
        'Coupon',
        {
          id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true,
            allowNull: false,
          },
          startDate: {
            type: Sequelize.DATE,
            allowNull: false,
          },
          endDate: {
            type: Sequelize.DATE,
            allowNull: true,
          },
          code: {
            type: Sequelize.STRING,
            unique: true,
            allowNull: false,
          },
          description: {
            type: Sequelize.STRING,
            allowNull: true,
          },
          type: {
            type: Sequelize.ENUM('fixed', 'percentage'),
            allowNull: false,
          },
          amount: {
            type: Sequelize.FLOAT,
            allowNull: false,
          },
          currency: {
            type: Sequelize.STRING,
          },
          active: {
            type: Sequelize.BOOLEAN,
            defaultValue: true,
          },
          numOfUsage: {
            type: Sequelize.INTEGER,
            allowNull: false,
            defaultValue: 0,
          },
          maxNumberOfUsage: {
            type: Sequelize.INTEGER,
            allowNull: true,
          },
          isAvailable: {
            type: Sequelize.BOOLEAN,
            defaultValue: true,
          },
          targetId: {
            type: Sequelize.UUID,
            allowNull: true,
          },
          createdAt: Sequelize.DATE,
          updatedAt: Sequelize.DATE,
        },
        { transaction },
      );
      await queryInterface.createTable('UserCoupon', {
        id: {
          type: Sequelize.INTEGER,
          primaryKey: true,
          autoIncrement: true,
          allowNull: false,
        },
        userId: {
          type: Sequelize.UUID,
          allowNull: false,
        },
        couponId: {
          type: Sequelize.INTEGER,
          allowNull: false,
        },
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

  down: async (queryInterface, Sequelize) => {
    let transaction = await queryInterface.sequelize.transaction();
    try {
      await queryInterface.dropTable('Coupon', {
        transaction,
      });
      await queryInterface.dropTable('UserCoupon', {
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
