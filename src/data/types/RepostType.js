import {
  GraphQLObjectType as ObjectType,
  GraphQLID as ID,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLFloat as FloatType,
  GraphQLBoolean as BooleanType,
} from 'graphql';

const RepostType = new ObjectType({
  name: 'RepostType',
  fields: {
    id: {
      type: IntType,
    },
    start_date: {
      type: StringType,
    },
    end_date: {
      type: StringType,
    },
    new_night_price: {
      type: FloatType,
    },
    repost_transaction_id: {
      type: IntType,
    },
    listing_id:{
      type: IntType,
    },
    userId:{
      type: StringType,
    },
    payment_status: {
      type: StringType,
    },
    isFixedPrice: {
      type: BooleanType,
    },
    status: {
      type: StringType,
    },
  },
});

export default RepostType;
