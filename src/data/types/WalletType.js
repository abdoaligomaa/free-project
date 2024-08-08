import {
  GraphQLObjectType as ObjectType,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLFloat as FloatType,
} from 'graphql';

const WalletType = new ObjectType({
  name: 'WalletType',
  fields: {
    id: {
      type: IntType,
    },
    userId: {
      type: StringType,
    },
    balance: {
      type: FloatType,
    },
  },
});

export default WalletType;
