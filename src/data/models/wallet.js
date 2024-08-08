import DataType from 'sequelize';
import Model from '../sequelize';

const Wallet = Model.define('Wallet', {
  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },
  userId: {
    type: DataType.STRING,
    allowNull: false,
  },
  balance: {
    type: DataType.FLOAT,
    defaultValue: 0,
  },
});

export default Wallet;