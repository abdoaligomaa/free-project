import Sequelize from 'sequelize';
import { databaseUrl } from '../config-sample';

const sequelize = new Sequelize(databaseUrl, {
  define: {
    freezeTableName: true,
  },

  logging: console.log,
});

export default sequelize;
