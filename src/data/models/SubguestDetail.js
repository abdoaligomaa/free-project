import DataType from 'sequelize';
import Model from '../sequelize';

const SubguestDetail = Model.define('SubguestDetail', {
  id: {
    type: DataType.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true,
  },
  amount: {
    type: DataType.INTEGER,
    allowNull: true,
  },

  bed: {
    type: DataType.INTEGER,
    allowNull: true,
  },
  bedroomNumber: {
    type: DataType.INTEGER,
    allowNull: true,
  },
  status: {
    type: DataType.STRING,
    allowNull: true,
    defaultValue: 'pending',
  },
  subguestId: {
    type: DataType.INTEGER,
    allowNull: true,
  },
  reservationId: {
    type: DataType.INTEGER,
    allowNull: false,
  },
  paymentIntentId: {
    type: DataType.STRING,
    allowNull: true,
  },
  spotStatus: {
    type: DataType.STRING,
    allowNull: true,
    defaultValue: 'pending',
  },
});

export default SubguestDetail;
