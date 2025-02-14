import DataType from 'sequelize';
import Model from '../../sequelize';
import bcrypt from 'bcryptjs';

const AdminUser = Model.define(
  'AdminUser',
  {
    id: {
      type: DataType.UUID,
      defaultValue: DataType.UUIDV1,
      primaryKey: true,
    },

    email: {
      type: DataType.STRING(255),
      validate: { isEmail: true },
      allowNull: false,
    },

    password: {
      type: DataType.STRING,
      allowNull: false,
    },

    emailConfirmed: {
      type: DataType.BOOLEAN,
      defaultValue: false,
    },

    isSuperAdmin: {
      type: DataType.BOOLEAN,
      defaultValue: false,
    },

    roleId: {
      type: DataType.INTEGER,
      allowNull: true,
      defaultValue: null,
    },
  },
  {
    classMethods: {
      generateHash: function (password) {
        return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
      },
    },

    indexes: [{ fields: ['email'] }],
  },
);

export default AdminUser;
