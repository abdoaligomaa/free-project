import DataType from 'sequelize';
import Model from '../sequelize';

const RepostFixedPrice = Model.define('RepostFixedPrice', {
  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },

  repostId: {
    type: DataType.INTEGER,
    allowNull: false,
  },

  from: {
    type: DataType.STRING,
    allowNull: false,
  },

  to: {
    type: DataType.STRING,
    allowNull: false,
  },

  price: {
    type: DataType.FLOAT,
    allowNull: false,
  },

});

export default RepostFixedPrice;
