import sequelize from '../../sequelize';
import {
  GraphQLList as List,
  GraphQLInt as IntType,
  GraphQLFloat as FloatType,
} from 'graphql';

// Models
import { Listing } from '../../../data/models';

// Types
import ShowListingType from '../../types/ShowListingType';
import { getListingPriceFromRepost } from '../../../helpers/getListingPriceFromRepost';
import moment from 'moment';

const getSimilarListing = {
  type: new List(ShowListingType),

  args: {
    lat: { type: FloatType },
    lng: { type: FloatType },
    listId: { type: IntType },
    limit: { type: IntType },
  },

  async resolve(source, { lat, lng, listId, limit }, { request } , cccc) {
    let similarLists = [];
    let listsLimit = limit ? limit : 4;

    const similarListData = await sequelize.query(
      `
              SELECT
                    id,
                    (
                      6371 *
                      acos(
                          cos( radians( ${lat} ) ) *
                          cos( radians( lat ) ) *
                          cos(
                              radians( lng ) - radians( ${lng} )
                          ) +
                          sin(radians( ${lat} )) *
                          sin(radians( lat ))
                      )
                  ) AS distance
                FROM
                    Listing
                WHERE
                    (
                       lat IS NOT NULL
                    ) AND (
                       lng IS NOT NULL
                    ) AND (
                      id != ${listId}
                    ) AND (
                      isPublished = true
                    )
                ORDER BY distance ASC
                LIMIT ${listsLimit}
                OFFSET 0 
    `,
      {
        type: sequelize.QueryTypes.SELECT,
      },
    );

    if (similarListData && similarListData.length > 0) {
      similarListData.map((item, index) => {
        similarLists.push(item.id);
      });

      const today = moment().format("YYYY-MM-DD");
      const listing =  await Listing.findAll({
        where: {
          id: {
            $in: [similarLists],
          },
          isAccepted: true,
          isPublished: true,
          startAvailableDate: {
            $lte: today,
          },
        },
      });
      const newListing = await getListingPriceFromRepost(listing);
      return newListing;
    } else {
      return await null;
    }
  },
};

export default getSimilarListing;

/*

query ($lat: Float, $lng: Float, $listId: Int, $limit: Int){
	getSimilarListing(listId: $listId, lat: $lat, lng: $lng, limit: $limit){
  	id
    title
    personCapacity
    beds
    bookingType
    coverPhoto
    reviewsCount,
    reviewsStarRating,
    listPhotos {
      id
      name
      type
      status
      review
    }
    listingData {
      basePrice
      currency
      cleaningPrice
    }
    settingsData {
      listsettings {
        id
        itemName
      }
    }
  }
}

*/
