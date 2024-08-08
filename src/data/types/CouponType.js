import {
  GraphQLObjectType as ObjectType,
  GraphQLID as ID,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLBoolean as BooleanType,
  GraphQLFloat as FloatType,
  GraphQLList as List,
} from 'graphql';
import UserType from './UserType';

const CouponType = new ObjectType({
  name: 'Coupon',
  fields: {
    id: {
      type: IntType,
    },
    startDate: {
      type: StringType,
    },
    endDate: {
      type: StringType,
    },
    code: {
      type: StringType,
    },
    description: {
      type: StringType,
    },
    type: {
      type: StringType,
    },
    amount: {
      type: FloatType,
    },
    currency: {
      type: StringType,
    },
    active: {
      type: BooleanType,
    },
    numOfUsage: {
      type: IntType,
    },
    maxNumberOfUsage: {
      type: IntType,
    },
    isAvailable: {
      type: BooleanType,
    },
    targetId: {
      type: ID,
    },
    status: {
      type: StringType,
    },
    errorMessage: {
      type: StringType,
    },
    users: {
      type: new List(UserType),
    },
    listingId: {
      type: IntType,
    },
    ownerId: {
      type: StringType,
    }
  },
});

export default CouponType;
