import {
  GraphQLObjectType as ObjectType,
  GraphQLString as StringType,
} from 'graphql';

const EditListingAcceptedType = new ObjectType({
  name: 'EditListingAcceptedType',
  fields: {
    status: {
      type: StringType,
    },
  },
});

export default EditListingAcceptedType;
