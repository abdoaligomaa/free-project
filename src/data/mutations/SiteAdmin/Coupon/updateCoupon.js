// GrpahQL
import {
  GraphQLID as ID,
  GraphQLNonNull as NonNull,
  GraphQLBoolean as BooleanType,
} from 'graphql';

// Sequelize models
import CouponType from '../../../types/CouponType';
import Coupon from '../../../models/Coupon';

const updateCoupon = {
  type: CouponType,

  args: {
    id: { type: new NonNull(ID) },
    active: { type: new NonNull(BooleanType) },
  },
  async resolve(source, { id, active }, { request } , cccc) {
    try {
      if (request.user && request.user.admin) {
        const count = await Coupon.update(
          {
            active,
          },
          {
            where: {
              id,
            },
          },
        );
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
      } else {
        return {
          status: 401,
          errorMessage: 'Oops! Please login and continue.',
        };
      }
    } catch (error) {
      return {
        status: 500,
        errorMessage: "Oops! can't update coupon",
      };
    }
  },
};

export default updateCoupon;
