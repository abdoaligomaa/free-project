import {
  GraphQLObjectType as ObjectType,
  GraphQLInt as IntType,
  GraphQLList as List,
} from 'graphql';
import CouponType from '../CouponType';
const GetAllCouponType = new ObjectType({
  name: 'GetAllCouponType',
  description: 'This represent coupon data for admin management',
  fields: {
    couponsData: {
      type: new List(CouponType),
    },
    count: {
      type: IntType,
    },
  },
});
export default GetAllCouponType;
