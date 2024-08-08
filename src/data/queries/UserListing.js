import ShowListingType from '../types/ShowListingType';
import { Bedroom, BedTypes, Listing } from '../../data/models';

import {
  GraphQLList as List,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLNonNull as NonNull,
  GraphQLBoolean as BooleanType,
} from 'graphql';
import { getListingDataPriceFromRepost } from '../../helpers/getListingDataPriceFromRepost';
import moment from 'moment';

const UserListing = {
  type: ShowListingType,

  args: {
    listId: { type: new NonNull(StringType) },
    preview: { type: BooleanType },
    withAccepted: { type: BooleanType },
  },

  async resolve(source, { listId, preview, withAccepted }, { request } , cccc) {
    let where;
    if (request.user && preview) {
      if (!request.user.admin) {
        const userId = request.user.id;
        where = {
          id: listId,
          userId,
        };
      } else {
        where = {
          id: listId,
        };
      }
    } else {
      where = {
        id: listId,
        isPublished: true,
      };
    }
    if (withAccepted && withAccepted === true && !!!preview) {
      const today = moment().format('YYYY-MM-DD');
      where.isAccepted = true;
      where.startAvailableDate = {
        $lte: today,
      };
    }
    const listingData = await Listing.find({
      where,
    });
    const newListingData = await getListingDataPriceFromRepost(listingData);
    return newListingData;
  },
};

export default UserListing;
