import DataType from 'sequelize';
import Model from '../sequelize';

const Bedrooms = Model.define('Bedrooms', {
  id: {
    type: DataType.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },

  listId: {
    type: DataType.INTEGER,
    allowNull: false,
  },

  description: {
    type: DataType.STRING,
    allowNull: true,
  },
  bedRoomNumber: {
    type: DataType.INTEGER,
    allowNull: true,
  },
  
});

export default Bedrooms;
