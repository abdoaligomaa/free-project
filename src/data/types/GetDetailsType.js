import {
  GraphQLObjectType as ObjectType,
  GraphQLString as StringType,
  GraphQLInt as IntType,
} from 'graphql';

const GetDetailsType = new ObjectType({
  name: 'getDetails',
  fields: {
    amount: { type: (IntType) },
    email: { type: (StringType) },
    bed: { type: IntType }
  },
});

export default GetDetailsType;
