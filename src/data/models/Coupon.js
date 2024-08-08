import DataType from 'sequelize';
import Model from '../sequelize';

const Coupon = Model.define('Coupon', {
  id: {
    type: DataType.INTEGER,
    primaryKey: true,
    autoIncrement: true,
    allowNull: false,
  },
  startDate: {
    type: DataType.DATE,
    allowNull: false,
  },
  endDate: {
    type: DataType.DATE,
    allowNull: true,
  },
  code: {
    type: DataType.STRING,
    unique: true,
    allowNull: false,
  },
  description: {
    type: DataType.STRING,
    allowNull: true,
  },
  type: {
    type: DataType.ENUM('fixed', 'percentage'),
    allowNull: false,
  },
  amount: {
    type: DataType.FLOAT,
    allowNull: false,
  },
  currency: {
    type: DataType.STRING,
  },
  active: {
    type: DataType.BOOLEAN,
    defaultValue: true,
  },
  numOfUsage: {
    type: DataType.INTEGER,
    allowNull: false,
    defaultValue: 0,
  },
  maxNumberOfUsage: {
    type: DataType.INTEGER,
    allowNull: true,
  },
  isAvailable: {
    type: DataType.BOOLEAN,
    defaultValue: true,
  },
  targetId: {
    type: DataType.UUID,
    allowNull: true,
  },
  ownerId: {
    type: DataType.UUID,
    allowNull: true,
  },
  listingId: {
    type: DataType.INTEGER,
    allowNull: true,
  },
});
export default Coupon;
