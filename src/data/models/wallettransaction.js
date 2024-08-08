import DataType from 'sequelize';
import Model from '../sequelize';

const WalletTransaction = Model.define('WalletTransaction', {
  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },
  isWithdrawal: {
    type: DataType.BOOLEAN,
    allowNull: false,
  },
  reservationId: {
    type: DataType.INTEGER,
    allowNull: false,
  },
  balance: {
    type: DataType.FLOAT,
    allowNull: false,
  },
  amount: {
    type: DataType.FLOAT,
    allowNull: false,
  },
  walletId: {
    type: DataType.INTEGER,
    allowNull: false,
  },
});

export default WalletTransaction;