// GrpahQL
import { GraphQLList } from 'graphql';

import ShowListingType from '../../types/ShowListingType';
import { Listing } from '../../models';

const getAllSwapListForCurrentUser = {
  type: new GraphQLList(ShowListingType),

  async resolve(args,source, { request } , cccc) {
    if (request.user) 
    {
      const id = request.user.id;
      let newVar = await Listing.findAll({
        where: {
          userId: id,
          isPublished: true,
          isAccepted: true,
          //isSwapAllowed: true,
        },
      });
      return newVar;
    }
    else {
      return [];
    }
  },
};

export default getAllSwapListForCurrentUser;