import {
  GraphQLObjectType as ObjectType,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLFloat as FloatType,
  GraphQLBoolean as BooleanType,
} from 'graphql';

const WalletTransactionType = new ObjectType({
  name: 'WalletTransactionType',
  fields: {
    id: {
      type: IntType,
    },
    isWithdrawal: {
      type: BooleanType,
    },
    reservationId: {
      type: IntType,
    },
    balance: {
      type: FloatType,
    },
    amount: {
      type: FloatType,
    },
    walletId: {
      type: IntType,
    },
  },
});

export default WalletTransactionType;
