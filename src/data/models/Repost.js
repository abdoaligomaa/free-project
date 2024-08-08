import DataType from 'sequelize';
import Model from '../sequelize';

const Repost = Model.define('Repost', {
  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },

  start_date: {
    type: DataType.STRING,
    allowNull: false,
  },

  end_date: {
    type: DataType.STRING,
    allowNull: false,
  },

  new_night_price: {
    type: DataType.FLOAT,
    allowNull: false,
  },

  repost_transaction_id: {
    type: DataType.INTEGER,
    allowNull: true,
  },

  listing_id: {
    type: DataType.INTEGER,
    allowNull: true,
  },

  userId: {
    type: DataType.STRING,
    allowNull: false,
  },
   
  payment_status: {
    type: DataType.ENUM('pending', 'completed'),
    defaultValue: 'pending',
  },

  isFixedPrice: {
    type: DataType.BOOLEAN,
    defaultValue: false
  },
  maxRepostPercentage: {
    type: DataType.INTEGER
  },
});

export default Repost;
