import {
  GraphQLObjectType as ObjectType,
  GraphQLString as StringType,
} from 'graphql';

import CouponType from './CouponType';

const CheckCouponType = new ObjectType({
  name: 'CheckCouponType',
  fields: {
    coupon: {
      type: CouponType,
    },
    status: {
      type: StringType,
    },
  },
});
export default CheckCouponType;
