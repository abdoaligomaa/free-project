import ShowListingType from '../types/ShowListingType';
import { Listing, Recommend } from '../../data/models';

import { GraphQLList as List, GraphQLString as StringType, } from 'graphql';
import { getListingPriceFromRepost } from '../../helpers/getListingPriceFromRepost';
import { getSiteAdminHomeRecommended } from '../../helpers/getSiteAdminHomeRecommended';
import moment from 'moment';
import { geSwapListing } from '../../helpers/geSwapListing';
import sequelize from "../sequelize";

const getRecommend = {
  type: new List(ShowListingType),
  args: {
    recommendType: { type: StringType },
  },

  async resolve(source, { recommendType }, { request } , cccc) {
    const today = moment().format("YYYY-MM-DD");
    const where = {
      isPublished: true,
      isAccepted: true,
      startAvailableDate: {
        $lte: today,
      },
    };
    const siteAdminHomeRecommended = await getSiteAdminHomeRecommended();
    if (recommendType && recommendType === 'recommendSwap') {
      if (siteAdminHomeRecommended.recommendedSwap && siteAdminHomeRecommended.recommendedSwap === true) {
        where.isSwapAllowed = true;
      } else {
        return [];
      }
    }
    if (recommendType && recommendType === 'recommendRepost') {
      if (siteAdminHomeRecommended.recommendedRepost && siteAdminHomeRecommended.recommendedRepost === true) {
        where.isRepostAllowed = true;
      } else {
        return [];
      }
    }
    if (recommendType && recommendType === 'recommendSharing') {
      where.id = {
        $in: [
          sequelize.literal(
            'SELECT Reservation.listId FROM Reservation ' +
            'INNER JOIN SubguestDetail ON Reservation.id = SubguestDetail.reservationId ' +
            'WHERE Reservation.isPublic = 1 AND ' +
            "Reservation.reservationState IN ('pending', 'approved') AND " +
            "SubguestDetail.status LIKE 'pending' AND " +
            'SubguestDetail.subguestId IS NULL',
          ),
        ],
      };
    }
    if (request.user && request.user.id && !request.user.admin) {
      where.userId = {
        $ne: request.user.id
      }
    }
    
    // Get Recommended Listings
    const listing = await Listing.findAll({
      where: where,
      include: [
        { model: Recommend, as: 'recommend', required: true },
      ],
    });
    let newListing = await getListingPriceFromRepost(listing);
    if (
      recommendType && recommendType === 'recommendSwap' && 
      request.user && request.user.id && !request.user.admin
    ) {
      newListing = await geSwapListing(newListing, request.user.id);
    }
    return newListing;
  },
};

export default getRecommend;
