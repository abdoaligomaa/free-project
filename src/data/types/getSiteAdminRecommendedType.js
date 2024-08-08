import {
  GraphQLObjectType as ObjectType,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLBoolean as BooleanType,
} from 'graphql';

const getSiteAdminRecommendedType = new ObjectType({
  name: 'SiteAdminRecommended',
  fields: {
    recommendedSwap: {
      type: BooleanType,
    },
    recommendedRepost: {
      type: BooleanType,
    },
    status: {
      type: StringType,
    },
  },
});

export default getSiteAdminRecommendedType;
