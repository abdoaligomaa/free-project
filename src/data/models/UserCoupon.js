import DataType from 'sequelize';
import Model from '../sequelize';

const UserCoupon = Model.define(
  'UserCoupon',
  {
    id: {
      type: DataType.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    userId: {
      type: DataType.UUID,
      allowNull: false,
    },
    couponId: {
      type: DataType.INTEGER,
      allowNull: false,
    },
  },
  { timestamps: false },
);
export default UserCoupon;
