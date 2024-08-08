import searchListingType from '../types/searchListingType';
import { Listing, ListViews, Recommend } from '../../data/models';
import sequelize from '../sequelize';

import {
  GraphQLList as List,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLFloat as FloatType,
  GraphQLBoolean as BoolType,
} from 'graphql';
import moment, { unix } from 'moment';
import { getListingPriceFromRepost } from '../../helpers/getListingPriceFromRepost';
import { getSiteAdminHomeRecommended } from '../../helpers/getSiteAdminHomeRecommended';
import { geSwapListing } from '../../helpers/geSwapListing';

const SearchListing = {
  type: searchListingType,

  args: {
    personCapacity: { type: IntType },
    dates: { type: StringType },
    currentPage: { type: IntType },
    lat: { type: FloatType },
    lng: { type: FloatType },
    roomType: { type: new List(IntType) },
    bedrooms: { type: IntType },
    bathrooms: { type: IntType },
    beds: { type: IntType },
    amenities: { type: new List(IntType) },
    spaces: { type: new List(IntType) },
    houseRules: { type: new List(IntType) },
    priceRange: { type: new List(FloatType) },
    geography: { type: StringType },
    bookingType: { type: StringType },
    geoType: { type: StringType },
    searchByMap: { type: BoolType },
    sw_lat: { type: FloatType },
    sw_lng: { type: FloatType },
    ne_lat: { type: FloatType },
    ne_lng: { type: FloatType },
    location: { type: StringType },
    zoomLevel: { type: IntType },
    repostAllowed: { type: BoolType },
    swapAllowed: { type: BoolType },
    hasSharingNow: { type: BoolType },
    viewType: { type: StringType },
  },

  async resolve(source,{
      personCapacity,
      dates,
      currentPage,
      lat,
      lng,
      roomType,
      bedrooms,
      bathrooms,
      beds,
      amenities,
      spaces,
      houseRules,
      priceRange,
      geography,
      bookingType,
      geoType,
      searchByMap,
      sw_lat,
      sw_lng,
      ne_lat,
      ne_lng,
      repostAllowed,
      swapAllowed,
      hasSharingNow,
      viewType,
    }, { request }, ccc) {
    try {
      let limit = 12,
        offset = 0,
        distance = 300;
      let publishedFilter = { isPublished: true };
      let unAvailableFilter = {
        id: {
          $notIn: [
            sequelize.literal(
              `SELECT listId FROM ListingData WHERE maxDaysNotice='unavailable'`,
            ),
          ],
        },
      };
      let mapBoundsFilter,
        geographyFilter,
        bookingTypeFilter = {},
        countryFilter = {};
      let bedRoomCountFilter = {},
        priceRangeFilter = {},
        bathRoomCountFilter = {},
        bedCountFilter = {};
      let personCapacityFilter = {},
        roomTypeFilter = {},
        amenitiesFilter = {},
        spacesFilter = {},
        houseRulesFilter = {};
      let dateRangeFilter = {},
        minNightsFilter = {},
        maxNightsFilter = {},
        minNightsRepostFilter = {},
        maxNightsRepostFilter = {},
        minNightsSwapFilter = {},
        maxNightsSwapFilter = {},
        maximumNoticeFilter = {};
      let hasSharingNowFilter = {};

      const siteAdminHomeRecommended = await getSiteAdminHomeRecommended();
      if (currentPage) offset = (currentPage - 1) * limit;

      // Booking Type Filter
      if (bookingType && bookingType === 'instant')
        bookingTypeFilter = { bookingType };

      if (sw_lat && ne_lat && sw_lng && ne_lng) {
        // Maps NorthWest & SouthEast view ports
        mapBoundsFilter = {
          id: {
            $in: [
              sequelize.literal(`
                  SELECT
                      id
                  FROM
                      Listing
                  WHERE
                      ( lat BETWEEN ${sw_lat} AND ${ne_lat} ) 
                  AND 
                      ( lng BETWEEN ${sw_lng} AND ${ne_lng} )`),
            ],
          },
        };
      }

      // Geography Type Filter
      if (geoType && !searchByMap) {
        let geographyConverted = await JSON.parse(geography);
        if (geoType === 'street') {
          geographyFilter = {
            $or: [
              {
                street: {
                  $like: '%' + geographyConverted.route + '%',
                },
                state: geographyConverted.administrative_area_level_1_short,
                country: geographyConverted.country,
              },
              {
                street: {
                  $like: '%' + geographyConverted.route + '%',
                },
                state: {
                  $like:
                    geographyConverted.administrative_area_level_1_long + '%',
                },
                country: geographyConverted.country,
              },
            ],
          };
          countryFilter = { country: geographyConverted.country };
        } else if (geoType === 'state') {
          geographyFilter = {
            $or: [
              {
                state: geographyConverted.administrative_area_level_1_short,
                country: geographyConverted.country,
              },
              {
                state: {
                  $like:
                    geographyConverted.administrative_area_level_1_long + '%',
                },
                country: geographyConverted.country,
              },
            ],
          };
          countryFilter = { country: geographyConverted.country };
        } else if (geoType === 'country') {
          countryFilter = { country: geographyConverted.country };
        }
      } else if (lat && lng && !searchByMap) {
        geographyFilter = {
          id: {
            $in: [
              sequelize.literal(`
                  SELECT
                      id
                  FROM
                      Listing
                  WHERE
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
                      ) < ${distance}
                `),
            ],
          },
        };
      }

      //Price Range Filter
      if (priceRange && priceRange.length > 0) {
        priceRangeFilter = {
          id: {
            $in: [
              sequelize.literal(
                `SELECT listId FROM ListingData WHERE (basePrice / (SELECT rate FROM CurrencyRates WHERE currencyCode=currency limit 1)) BETWEEN ${priceRange[0]} AND ${priceRange[1]}`,
              ),
            ],
          },
        };
      }

      //Number of Bed Rooms Filter
      if (bedrooms) bedRoomCountFilter = { bedrooms: { $gte: bedrooms } };

      //Number of  Bathrooms Filter
      if (bathrooms) bathRoomCountFilter = { bathrooms: { $gte: bathrooms } };

      //Number of Beds Filter
      if (beds) bedCountFilter = { beds: { $gte: beds } };

      //Person Capacity Filter
      if (personCapacity)
        personCapacityFilter = { personCapacity: { $gte: personCapacity } };

      // Room type Filter
      if (roomType && roomType.length > 0) {
        roomTypeFilter = {
          id: {
            $in: [
              sequelize.literal(
                `SELECT listId FROM UserListingData WHERE settingsId in(${roomType.toString()})`,
              ),
            ],
          },
        };
      }

      // Amenities Filter
      if (amenities && amenities.length > 0) {
        amenitiesFilter = {
          id: {
            $in: [
              sequelize.literal(
                `SELECT listId FROM UserAmenities WHERE amenitiesId in(${amenities.toString()}) GROUP BY listId HAVING COUNT(listId) >= ${
                  amenities.length
                }`,
              ),
            ],
          },
        };
      }

      // Spaces Filter
      if (spaces && spaces.length > 0) {
        spacesFilter = {
          id: {
            $in: [
              sequelize.literal(
                `SELECT listId FROM UserSpaces WHERE spacesId in(${spaces.toString()}) GROUP BY listId HAVING COUNT(listId) >= ${
                  spaces.length
                }`,
              ),
            ],
          },
        };
      }

      // House Rules Filter
      if (houseRules && houseRules.length > 0) {
        houseRulesFilter = {
          id: {
            $in: [
              sequelize.literal(
                `SELECT listId FROM UserHouseRules WHERE houseRulesId in(${houseRules.toString()}) GROUP BY listId HAVING COUNT(listId) >= ${
                  houseRules.length
                }`,
              ),
            ],
          },
        };
      }

      if (dates && dates.toString().trim() !== '') {
        let checkIn = moment(dates.toString().split('AND')[0]),
          checkOut = moment(dates.toString().split('AND')[1]);
        let noticeFilter = [];
        [3, 6, 9, 12].map(value => {
          let date = moment().add(value, 'months').format('YYYY-MM-DD');
          if (checkOut.isBetween(checkIn, date))
            noticeFilter.push(`'${value}months'`);
        });

        //Maximum Notice Filter
        maximumNoticeFilter = {
          id: {
            $in: [
              sequelize.literal(
                "SELECT listId FROM ListingData WHERE maxDaysNotice in ('available'," +
                  noticeFilter.toString() +
                  ')',
              ),
            ],
          },
        };

        // Date Range Filter
        dateRangeFilter = {
          id: {
            $notIn: [
              sequelize.literal(
                'SELECT listId FROM ListBlockedDates WHERE blockedDates BETWEEN' +
                  dates +
                  "and calendarStatus != 'available'",
              ),
            ],
          },
        };

        //Min Night Filter
        minNightsFilter = {
          id: {
            $in: [
              sequelize.literal(
                `SELECT listId FROM ListingData WHERE minNight = 0 OR minNight <= ${checkOut.diff(
                  checkIn,
                  'days',
                )}`,
              ),
            ],
          },
        };

        //Max Night Filter
        maxNightsFilter = {
          id: {
            $in: [
              sequelize.literal(
                `SELECT listId FROM ListingData WHERE maxNight = 0 OR maxNight >= ${checkOut.diff(
                  checkIn,
                  'days',
                )}`,
              ),
            ],
          },
        };

        if (repostAllowed) {
          //Min Night Repost Filter
          minNightsRepostFilter = {
            id: {
              $in: [
                sequelize.literal(
                  `SELECT listId FROM listingdata WHERE minNightRepost = 0 OR minNightRepost <= ${checkOut.diff(
                    checkIn,
                    'days',
                  )}`,
                ),
              ],
            },
          };

          //Max Night Repost Filter
          maxNightsRepostFilter = {
            id: {
              $in: [
                sequelize.literal(
                  `SELECT listId FROM listingdata WHERE maxNightRepost = 0 OR maxNightRepost >= ${checkOut.diff(
                    checkIn,
                    'days',
                  )}`,
                ),
              ],
            },
          };
        }

        if (swapAllowed) {
          //Min Night Swap Filter
          minNightsSwapFilter = {
            id: {
              $in: [
                sequelize.literal(
                  `SELECT listId FROM listingdata WHERE minNightSwap = 0 OR minNightSwap <= ${checkOut.diff(
                    checkIn,
                    'days',
                  )}`,
                ),
              ],
            },
          };

          //Max Night Swap Filter
          maxNightsSwapFilter = {
            id: {
              $in: [
                sequelize.literal(
                  `SELECT listId FROM listingdata WHERE maxNightSwap = 0 OR maxNightSwap >= ${checkOut.diff(
                    checkIn,
                    'days',
                  )}`,
                ),
              ],
            },
          };
        }
      }

      if (hasSharingNow) {
        hasSharingNowFilter = {
          id: {
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
          },
        };
      }

      let where = {},
        filters = [
          bookingTypeFilter,
          bedRoomCountFilter,
          priceRangeFilter,
          bathRoomCountFilter,
          bedCountFilter,
          personCapacityFilter,
          roomTypeFilter,
          amenitiesFilter,
          spacesFilter,
          houseRulesFilter,
          dateRangeFilter,
          minNightsFilter,
          maxNightsFilter,
          minNightsRepostFilter,
          maxNightsRepostFilter,
          minNightsSwapFilter,
          maxNightsSwapFilter,
          maximumNoticeFilter,
          publishedFilter,
          unAvailableFilter,
          countryFilter, //To prevent france country's Listing in the result, while searching for United Kingdom country
          hasSharingNowFilter,
        ];
      const swapAndRepostFilter = [];
      if (repostAllowed !== undefined && repostAllowed !== false)
        swapAndRepostFilter.push({ isRepostAllowed: repostAllowed });
      if (swapAllowed !== undefined && swapAllowed !== false)
        swapAndRepostFilter.push({ isSwapAllowed: swapAllowed });        
      if (mapBoundsFilter || geographyFilter) {
        where = {
          $or: [
            mapBoundsFilter || {},
            geographyFilter || {},
            ...swapAndRepostFilter,
          ],
          $and: filters,
        };
      } else {
        where = { $and: filters };
        if (swapAndRepostFilter.length > 0) where['$or'] = swapAndRepostFilter; // this condition work only with filter
      }

      const today = moment().format("YYYY-MM-DD");
      where.isAccepted = true;
      where.startAvailableDate = {
        $lte: today,
      };
      if (request.user && request.user.id && !request.user.admin) {
        if (
          ((swapAllowed !== undefined && swapAllowed !== false) || 
          (
            viewType &&
            viewType === 'recommendedSwap' &&
            siteAdminHomeRecommended.recommendedSwap &&
            siteAdminHomeRecommended.recommendedSwap === true
          )) ||
          ((repostAllowed !== undefined && repostAllowed !== false) || 
          (
            viewType &&
            viewType === 'recommendedRepost' &&
            siteAdminHomeRecommended.recommendedRepost &&
            siteAdminHomeRecommended.recommendedRepost === true
          )) ||
          (viewType && viewType === 'recommended')
        ) {
          where.userId = {
            $ne: request.user.id
          }
        }
        
      }

      // View All
      let values = {
        attributes: [
          'id',
          'title',
          'personCapacity',
          'lat',
          'lng',
          'beds',
          'coverPhoto',
          'bookingType',
          'userId',
          'reviewsCount',
          'isRepostAllowed',
          'isSwapAllowed',
          'country',
          'swapAllowAnyDate',
          'swapStartDate',
          'swapEndDate',
        ],
        where,
        limit,
        offset,
        order: [
          ['reviewsCount', 'DESC'],
          ['createdAt', 'DESC'],
        ],
      };
      if (viewType && viewType === 'recommended') {
        values.include = [
          { model: Recommend, as: 'recommend', required: true },
        ];
      }
      if (
        viewType &&
        viewType === 'recommendedSwap' &&
        siteAdminHomeRecommended.recommendedSwap &&
        siteAdminHomeRecommended.recommendedSwap === true
      ) {
        where.isSwapAllowed = true;
        values.include = [
          { model: Recommend, as: 'recommend', required: true },
        ];
      }
      if (
        viewType &&
        viewType === 'recommendedRepost' &&
        siteAdminHomeRecommended.recommendedRepost &&
        siteAdminHomeRecommended.recommendedRepost === true
      ) {
        where.isRepostAllowed = true;
        values.include = [
          { model: Recommend, as: 'recommend', required: true },
        ];
      }
      if (viewType && viewType === 'mostViewed') {
        values.include = [
          {
            model: ListViews,
            attributes: [],
            as: 'listViews',
            required: true,
            duplicating: false,
          },
        ];
        values.order = [
          [sequelize.fn('count', sequelize.col('listViews.listId')), 'DESC'],
        ];
        values.group = ['listViews.listId'];
      }

      // SQL query for count
      const count = await Listing.count({ where });

      // SQL query for results
      const results = await Listing.findAll(values);
      let newResults = await getListingPriceFromRepost(results);
      if (
        ((swapAllowed !== null && swapAllowed === true) || 
      (
        viewType &&
        viewType === 'recommendedSwap' &&
        siteAdminHomeRecommended.recommendedSwap &&
        siteAdminHomeRecommended.recommendedSwap === true
      )) && 
      request.user && request.user.id && !request.user.admin) {
        newResults = await geSwapListing(newResults, request.user.id);
      }

      return {
        count: count === newResults.length ? count : newResults.length,
        results: newResults,
        recommendedSwap: siteAdminHomeRecommended.recommendedSwap,
        recommendedRepost: siteAdminHomeRecommended.recommendedRepost,
      };
    } catch (e) {
      console.error(e);
      return {
        count: 0,
        results: [],
      };
    }
  },
};

export default SearchListing;
