import DataType from 'sequelize';
import Model from '../sequelize';

const Reposts_Transaction = Model.define('Reposts_Transaction', {
  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },

  repost_id: {
    type: DataType.INTEGER,
    allowNull: false,
  },

  payer_email: {
    type: DataType.STRING,
    allowNull: true,
  },

  payer_id: {
    type: DataType.STRING,
    allowNull: true,
  },

  receiver_email: {
    type: DataType.STRING,
    allowNull: true,
  },

  receiver_id: {
    type: DataType.STRING,
    allowNull: true,
  },

  transaction_id: {
    type: DataType.STRING,
    defaultValue: 1,
  },

  total: {
    type: DataType.FLOAT,
    allowNull: false,
  },

  transaction_fee: {
    type: DataType.FLOAT,
    allowNull: true,
  },

  currency: {
    type: DataType.STRING,
    allowNull: false,
  },

  ipn_track_id: {
    type: DataType.STRING,
  },

  payment_type: {
    type: DataType.ENUM('booking', 'cancellation', 'host'),
    defaultValue: 'booking',
  },

  payment_method_id: {
    type: DataType.STRING,
  },
});

export default Reposts_Transaction;
