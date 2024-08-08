import {
  GraphQLObjectType as ObjectType,
  GraphQLString as StringType,
} from 'graphql';

const NewSubgustType = new ObjectType({
  name: 'NewSubgustType',
  fields: {
    status: {
      type: StringType,
    },
  },
});

export default NewSubgustType;
