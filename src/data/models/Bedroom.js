import DataType from 'sequelize';
import Model from '../sequelize';
const Bedroom = Model.define('Bedroom', {
  id: {
    type: DataType.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },

  listId: {
    type: DataType.INTEGER,
    allowNull: false,
  },
});

export default Bedroom;
