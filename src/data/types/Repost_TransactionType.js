import {
  GraphQLObjectType as ObjectType,
  GraphQLID as ID,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLFloat as FloatType,
} from 'graphql';

const Repost_TransactionType = new ObjectType({
  name: 'Repost_TransactionType',
  fields: {
    id: {
      type: IntType,
    },
    repost_id: {
      type: IntType,
    },
    payer_email: {
      type: StringType,
    },
    payer_id: {
      type: StringType,
    },
    receiver_email: {
      type: StringType,
    },
    receiver_id: {
      type: StringType,
    },
    transaction_id: {
      type: StringType,
    },
    total: {
      type: FloatType,
    },
    transaction_fee: {
      type: FloatType,
    },
    currency: {
      type: StringType,
    },
    ipn_track_id: {
      type: StringType,
    },
    payment_type: {
      type: StringType,
    },
    createdAt: {
      type: StringType,
    },
    updatedAt: {
      type: StringType,
    },
    status: {
      type: StringType,
    },
    payment_method_id: {
      type: StringType,
    },
  },
});

export default Repost_TransactionType;
