// GrpahQL
import {
  GraphQLString as StringType,
  GraphQLObjectType as ObjectType,
  GraphQLInt as IntType,
  GraphQLNonNull as NonNull,
  GraphQLFloat as FloatType,
  GraphQLEnumType as EnumType,
} from 'graphql';

// Sequelize models
import CouponType from '../../../types/CouponType';
import Coupon from '../../../models/Coupon';
import { User } from '../../../models';
import moment from 'moment';

const createCoupon = {
  type: CouponType,

  args: {
    startDate: { type: new NonNull(StringType) },
    endDate: { type: StringType },
    code: { type: new NonNull(StringType) },
    description: { type: StringType },
    type: {
      type: new NonNull(
        new EnumType({
          name: 'couponType',
          values: {
            fixed: { value: 'fixed' },
            percentage: { value: 'percentage' },
          },
        }),
      ),
    },
    amount: { type: new NonNull(FloatType) },
    currency: { type: StringType },
    maxNumberOfUsage: { type: IntType },
    targetEmail: { type: StringType },
    listingId: { type: IntType }
  },

  async resolve(source,{
      code,
      description,
      type,
      amount,
      currency,
      startDate,
      endDate,
      maxNumberOfUsage,
      targetEmail,
      listingId,      
    }, { request }, ccc) {
    try {
      if (request.user ) {
        const trimingCode = code.trim()
        if (trimingCode.indexOf(' ') >= 0) {
          return {
            status: 'code',
            errorMessage: '!Oops code can not has a space',
          };
        } else {
          const checkCoupon = await Coupon.findOne({
            attributes: ['id', 'code'],
            where: {
              code: trimingCode,
            },
          });
          if (checkCoupon) {
            return {
              status: 'code',
              errorMessage: '!Oops code already exists',
            };
          }
        }
        const couponDetails = {
          startDate:moment(startDate).format('YYYY-MM-DD'),
          endDate: moment(endDate).format('YYYY-MM-DD') ? moment(endDate).format('YYYY-MM-DD') : null,
          code,
          description: description ? description : null,
          type,
          amount,
          currency,
          maxNumberOfUsage: maxNumberOfUsage ? maxNumberOfUsage : null,
          listingId: request.user.admin ? null : listingId,
          ownerId: request.user.id,          
        };
        if (targetEmail) {
          const user = await User.findOne({
            attributes: ['id'],
            where: {
              email: targetEmail,
              userBanStatus: {
                $ne: true,
              },
              userDeletedAt: null,
            },
          });
          if (!user) {
            return {
              status: 'targetEmail',
              errorMessage: 'Oops! target email not found',
            };
          } else if(user.id == request.user.id) {
            return {
              status: 'targetEmail',
              errorMessage: 'Oops! that is your email',
            };
          } else {            
            couponDetails.targetId = user.id;
          }
        }
        const createCoupon = await Coupon.create(couponDetails);
        return {
          code: createCoupon.code,
          status: 'success',
        };
      } else {
        return {
          status: 401,
          errorMessage: 'Oops! Please login and continue.',
        };
      }
    } catch (error) {
      return {
        status: 500,
        errorMessage: "Oops! can't create coupon",
      };
    }
  },
};

export default createCoupon;
