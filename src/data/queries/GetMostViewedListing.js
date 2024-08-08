import ShowListingType from '../types/ShowListingType';
import { ListViews, Listing } from '../../data/models';
import sequelize from '../sequelize';

import { GraphQLList as List } from 'graphql';
import { getListingPriceFromRepost } from '../../helpers/getListingPriceFromRepost';
import moment from 'moment';

const GetMostViewedListing = {
  type: new List(ShowListingType),

  async resolve(args,source, { request } , cccc) {
    const today = moment().format("YYYY-MM-DD");
    const listing =  await Listing.findAll({
      where: {
        isPublished: true,
        isAccepted: true,
        startAvailableDate: {
          $lte: today,
        },
      },
      include: [
        {
          model: ListViews,
          attributes: [],
          as: 'listViews',
          required: true,
          duplicating: false,
        },
      ],
      order: [
        [sequelize.fn('count', sequelize.col('listViews.listId')), 'DESC'],
      ],
      group: ['listViews.listId'],
      limit: 10,
      offset: 0,
    });
    const newListing = await getListingPriceFromRepost(listing);
    return newListing;
  },
};

export default GetMostViewedListing;
