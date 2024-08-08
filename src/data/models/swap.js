import DataType from 'sequelize';
import Model from '../sequelize';
import moment from 'moment';

const Swap = Model.define('Swap', {
  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },

  hostId: {
    type: DataType.STRING,
    allowNull: false,
  },

  guestId: {
    type: DataType.STRING,
    allowNull: false,
  },
  hostListId: {
    type: DataType.INTEGER,
    allowNull: false,
  },
  guestListId: {
    type: DataType.INTEGER,
    allowNull: false,
  },
  checkIn: {
    type: DataType.DATEONLY,
    allowNull: false,
    get: function () {
      return this.getDataValue('checkIn')
        ? moment.utc(this.getDataValue('checkIn')).format('YYYY-MM-DD')
        : null;
    },
  },
  checkOut: {
    type: DataType.DATEONLY,
    allowNull: false,
    get: function () {
      return this.getDataValue('checkOut')
        ? moment.utc(this.getDataValue('checkOut')).format('YYYY-MM-DD')
        : null;
    },
  },
  swapStatus: {
    type: DataType.ENUM('pending', 'accepted', 'rejected', 'payIn'),
    defaultValue: 'pending',
  },
  swapCountry: {
    type: DataType.STRING,
    allowNull: true,
  },
  swapDatesSelected: {
    type: DataType.INTEGER,
    allowNull: true,
  },
  swapStayedNights: {
    type: DataType.INTEGER,
    allowNull: true,
  },
  swapIsSpecialPriceAssigned: {
    type: DataType.BOOLEAN,
    allowNull: true,
  },
  swapIsAverage: {
    type: DataType.STRING,
    allowNull: true,
  },
  swapCurrency: {
    type: DataType.STRING,
    allowNull: true,
  },
  swapDayDifference: {
    type: DataType.INTEGER,
    allowNull: true,
  },
  swapIsDayTotal: {
    type: DataType.STRING,
    allowNull: true,
  },
  swapDiscount: {
    type: DataType.STRING,
    allowNull: true,
  },
  swapDiscountType: {
    type: DataType.STRING,
    allowNull: true,
  },
  swapCleaningPrice: {
    type: DataType.STRING,
    allowNull: true,
  },
  swapServiceFee: {
    type: DataType.STRING,
    allowNull: true,
  },
  swapTotal: {
    type: DataType.STRING,
    allowNull: true,
  },
  couponAmount: {
    type: DataType.STRING,
    allowNull: true,
  },
  couponCurrency: {
    type: DataType.STRING,
    allowNull: true,
  },
  couponType: {
    type: DataType.STRING,
    allowNull: true,
  },
});

export default Swap;
