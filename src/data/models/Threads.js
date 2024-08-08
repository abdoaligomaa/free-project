import DataType from 'sequelize';
import Model from '../sequelize';

const Threads = Model.define('Threads', {
  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },

  listId: {
    type: DataType.INTEGER,
    defaultValue: null,
    allowNull: true,
  },

  swapId: {
    type: DataType.INTEGER,
    defaultValue: null,
    allowNull: true,
  },

  swapHostListId: {
    type: DataType.INTEGER,
    defaultValue: null,
    allowNull: true,
  },

  swapGuestListId: {
    type: DataType.INTEGER,
    defaultValue: null,
    allowNull: true,
  },

  host: {
    type: DataType.STRING,
    allowNull: false,
  },

  guest: {
    type: DataType.STRING,
    allowNull: false,
  },

  isRead: {
    type: DataType.BOOLEAN,
    defaultValue: false,
  },

  messageUpdatedDate: {
    type: DataType.DATE,
  },
});

export default Threads;
