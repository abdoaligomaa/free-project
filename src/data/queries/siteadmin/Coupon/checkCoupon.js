// GrpahQL
import {
  GraphQLNonNull as NonNull,
  GraphQLString as StringType,
} from 'graphql';
import moment from 'moment';
import Coupon from '../../../models/Coupon';
import UserCoupon from '../../../models/UserCoupon';
import AdminUser from '../../../models/siteadmin/AdminUser';
import CheckCouponType from '../../../types/CheckCouponType';

const checkCoupon = {
  type: CheckCouponType,

  args: {
    code: { type: new NonNull(StringType) },
    startDate: { type: new NonNull(StringType) },
    endDate: { type: new NonNull(StringType) },
    id: { type: new NonNull(StringType) },
  },
  async resolve(source, { code, startDate, endDate, id }, { request }, cccc) {
    try {
      if (request.user) {
        const coupon = await Coupon.findOne({
          where: {
            code,
          },
        });

        if (!coupon) {
          return {
            status: 'invalid',
          };
        } else {
          const usedCoupon = await UserCoupon.findOne({
            where: {
              couponId: coupon.id,
            },
          });
          const adminCoupon = await AdminUser.findOne({
            where: {
              id: coupon.ownerId,
            },
          });
          if (adminCoupon || !coupon.ownerId) {
            if (
              (coupon.targetId && coupon.targetId !== request.user.id) ||
              moment(moment.now()).diff(moment(coupon.startDate)) <= 0
            ) {
              return {
                status: 'invalid',
              };
            }

            if (
              !coupon.active ||
              !coupon.isAvailable ||
              moment(coupon.endDate).diff(moment(moment.now())) <= 0 ||
              coupon.numberOfUsage === coupon.maxNumberOfUsage
            ) {
              return {
                status: 'expired',
              };
            }
            return {
              status: 'valid',
              coupon,
            };
          } else {
            if (
              moment(moment.now()).diff(moment(coupon.createdAt), 'hours') > 24
            ) {
              return {
                status: 'invalid',
              };
            }

            if (
              coupon?.targetId !== request.user.id ||
              coupon.listingId != id
            ) {
              return {
                status: 'invalid',
              };
            }

            const couponStart = moment(coupon.startDate).format('DD/MM/YYYY');
            const couponEnd = moment(coupon.endDate).format('DD/MM/YYYY');
            if (
              !coupon.active ||
              !coupon.isAvailable ||
              coupon.numberOfUsage === coupon.maxNumberOfUsage ||
              moment(couponStart).diff(moment(startDate), 'day') !== 0 ||
              moment(endDate).diff(moment(couponEnd), 'day') !== 0 ||
              usedCoupon
            ) {
              return {
                status: 'expired',
              };
            }
            return {
              status: 'valid',
              coupon,
            };
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
        errorMessage: "Oops! can't get coupons",
      };
    }
  },
};

export default checkCoupon;
