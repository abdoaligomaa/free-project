import DataType from 'sequelize';
import Model from '../sequelize';

const Repost_Share = Model.define('Repost_Share', {
  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },

  reservation_id: {
    type: DataType.INTEGER,
    allowNull: true,
  },

  transaction_id: {
    type: DataType.INTEGER,
    allowNull: true,
  },

  amount: {
    type: DataType.FLOAT,
    allowNull: false,
  },

  host_id: {
    type: DataType.STRING,
    allowNull: false,
  },

  start_date: {
    type: DataType.STRING,
    allowNull: false,
  },

  end_date: {
    type: DataType.STRING,
    allowNull: false,
  },

  repost_id: {
    type: DataType.INTEGER,
    allowNull: true,
  },

  is_paid_out: {
    type: DataType.BOOLEAN,
    defaultValue: false
  }

});

export default Repost_Share;