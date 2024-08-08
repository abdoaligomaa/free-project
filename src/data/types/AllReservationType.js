import {
  GraphQLObjectType as ObjectType,
  GraphQLList as List,
  GraphQLString as StringType,
  GraphQLInt as IntType,
} from 'graphql';

import ReservationType from './ReservationType';
import Repost_TransactionType from './Repost_TransactionType';

const AllReservationType = new ObjectType({
  name: 'AllReservation',
  fields: {
    reservationData: {
      type: new List(ReservationType),
    },
    repostData: {
      type: new List(Repost_TransactionType)
    },
    count: {
      type: IntType,
    },
    currentPage: {
      type: IntType,
    },
    status: {
      type: StringType,
    },
  },
});

export default AllReservationType;
