import {
  GraphQLObjectType as ObjectType,
  GraphQLInt as IntType,
  GraphQLList as List,
} from 'graphql';
import UserBedTypes from './UserBedTypes';

const BedroomType = new ObjectType({
  name: 'Bedroom',
  fields: {
    id: {
      type: IntType,
    },
    listId: {
      type: IntType,
    },
    userBedTypes: {
      type: new List(UserBedTypes),
    },
  },
});

export default BedroomType;
