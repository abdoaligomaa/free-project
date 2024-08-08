import {
  GraphQLObjectType as ObjectType,
  GraphQLString as StringType,
  GraphQLBoolean as BooleanType,
  GraphQLList as List,
} from 'graphql';

import ShowListingType from './ShowListingType';

const searchListingType = new ObjectType({
  name: 'SearchListing',
  fields: {
    count: { type: StringType },
    results: { type: new List(ShowListingType) },
    recommendedSwap: { type: BooleanType },
    recommendedRepost: { type: BooleanType },
    status: { type: StringType },
  },
});

export default searchListingType;
