// GrpahQL
import { GraphQLInt as IntType, GraphQLNonNull as NonNull } from 'graphql';

// Sequelize models
import CouponType from '../../../types/CouponType';
import Coupon from '../../../models/Coupon';
import UserCoupon from '../../../models/UserCoupon'

const deleteCoupon = {
  type: CouponType,

  args: {
    id: { type: new NonNull(IntType) },
  },
  async resolve(source, { id }, { request } , cccc) {
    try {
      if (request.user) {
        const hostID = await Coupon.findOne({
          where: {
            id,
          },
        });
        if (hostID && hostID.ownerId === request.user.id) {
          const isUsed = await UserCoupon.findOne({
            where: {
              couponId: id,
            }
          })
          if (isUsed) {
            return {
              status: 500,
              message: 'can not delete a used coupon',
            };
          } else {
            const count = await Coupon.destroy({
              where: {
                id,
              },
            });
            if (count) {
              return {
                status: 204,
                message: 'success',
              };
            } else {
              return {
                status: 500,
                message: 'failed',
              };
            }
          }
        }
      } else {
        return {
          status: 401,
          errorMessage: 'Oops! Please login and continue.',
        };
      }
    } catch (error) {
      return {
        status: 500,
        errorMessage: "Oops! can't delete coupon",
      };
    }
  },
};

export default deleteCoupon;
