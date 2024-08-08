import {
  GraphQLObjectType as ObjectType,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLBoolean as BooleanType,
  GraphQLFloat as FloatType,
} from 'graphql';

const SubguestDetailType = new ObjectType({
  name: 'SubguestDetail',
  fields: {
    id: {
      type: IntType,
    },
    subguestId: {
      type: IntType,
    },
    amount: {
      type: FloatType,
    },
    bed: {
      type: IntType,
    },
    bedroomNumber: {
      type: IntType,
    },
    status: {
      type: StringType,
    },
    reservationId: {
      type: IntType,
    },
    paymentIntentId: {
      type: StringType,
    },
  },
});

export default SubguestDetailType;
