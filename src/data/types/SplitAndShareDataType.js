import {
  GraphQLObjectType as ObjectType,
  GraphQLID as ID,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLFloat as FloatType,
} from 'graphql';

const SplitAndShareDataType = new ObjectType({
  name: 'SplitAndShareDataType',
  fields: {
    id: {
      type: IntType,
    },
    status: {
      type: StringType,
    },
    bed: {
      type: IntType,
    },
    amount: {
      type: FloatType,
    },
    email: {
      type: StringType,
    },
    profileId: {
      type: IntType,
    },
    profileName: {
      type: StringType,
    },
    profileAvatar: {
      type: StringType,
    },
    subguestId: {
      type: IntType,
    },
    reservationId: {
      type: IntType,
    },
    userId: {
      type: StringType,
    },
    spotStatus: {
      type: StringType,
    },
  },
});

export default SplitAndShareDataType;
