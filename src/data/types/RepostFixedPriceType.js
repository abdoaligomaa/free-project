import {
  GraphQLObjectType as ObjectType,
  GraphQLID as ID,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLFloat as FloatType,
} from 'graphql';

const RepostFixedPriceType = new ObjectType({
  name: 'RepostFixedPriceType',
  fields: {
    id: {
      type: IntType,
    },
    repostId: {
      type: IntType,
    },
    from: {
      type: StringType,
    },
    to: {
      type: StringType,
    },
    price: {
      type: FloatType,
    },
  },
});

export default RepostFixedPriceType;
