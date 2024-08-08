import {
  GraphQLObjectType as ObjectType,
  GraphQLID as ID,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLFloat as FloatType,
  GraphQLBoolean as BooleanType
} from 'graphql';

const Repost_ShareType = new ObjectType({
  name: 'Repost_ShareType',
  fields: {
    id: {
      type: IntType,
    },

    reservation_id: {
      type: IntType,
    },

    transaction_id: {
      type: IntType,
    },

    amount: {
      type: FloatType,
    },

    host_id: {
      type: StringType,
    },

    start_date: {
      type: StringType,
    },

    end_date: {
      type: StringType,
    },

    repost_id: {
      type: IntType,
    },

    is_paid_out: {
      type: BooleanType,
    },

  },
});

export default Repost_ShareType;
