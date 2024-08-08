// GrpahQL
import { GraphQLNonNull as NonNull, GraphQLInt as IntType } from 'graphql';
import { User } from '../../../models';
import Coupon from '../../../models/Coupon';
import CouponType from '../../../types/CouponType';

const getCoupon = {
  type: CouponType,

  args: {
    id: { type: new NonNull(IntType) },
  },
  async resolve(source, { id }, { request } , cccc) {
    try {
      if (request.user) {
        return Coupon.findById(id);
      } else {
        return {
          status: 401,
          errorMessage: 'Oops! Please login and continue.',
        };
      }
    } catch (error) {
      return {
        status: 500,
        errorMessage: "Oops! can't get coupons",
      };
    }
  },
};

export default getCoupon;
