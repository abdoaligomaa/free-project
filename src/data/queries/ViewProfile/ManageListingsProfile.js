import ShowListingType from '../../types/ShowListingType';

import { Listing } from '../../../data/models';

import { GraphQLList as List, GraphQLString as StringType } from 'graphql';

const ManageListingsProfile = {
  type: new List(ShowListingType),

  args: {
    userId: { type: StringType },
  },

  async resolve(source, { userId }, { request, response } , cccc) {
    const limit = 12;
    return await Listing.findAll({
      where: {
        userId,
        isPublished: true,
      },
      order: 'createdAt DESC',
      limit,
    });
  },
};

export default ManageListingsProfile;
