import {
  GraphQLObjectType as ObjectType,
  GraphQLString as StringType,
  GraphQLBoolean as BooleanType,
  GraphQLInt as IntType,
  GraphQLFloat as FloatType,
  GraphQLList as List,
} from 'graphql';

import moment from 'moment';

import UserVerifiedInfoType from './UserVerifiedInfoType';
import CancellationType from './CancellationType';
import ListCalendarType from './ListCalendarType';
import UserBedTypes from './UserBedTypes';
import ReviewsType from './ReviewsType';
import ListBlockedDatesType from './ListBlockedDatesType';
import ListingHistoryType from './ListingHistoryType';

//Helper
import { getDateUsingTimeZone } from '../../helpers/dateRange';

import {
  Cancellation,
  Reviews,
  ListCalendar,
  WishList,
  Listing,
  BedTypes,
  ListBlockedDates,
  ListingPermissionHistory,
  // Repost,
  RepostFixedPrice,
  ListPhotos,
  Bedrooms,
} from '../models';
import BedroomType from './BedroomType';
import sequelize from '../sequelize';

const Profile = new ObjectType({
  name: 'profile',
  fields: {
    profileId: {
      type: IntType,
    },
    firstName: {
      type: StringType,
    },
    lastName: {
      type: StringType,
    },
    displayName: {
      type: StringType,
    },
    dateOfBirth: {
      type: StringType,
    },
    picture: {
      type: StringType,
    },
    location: {
      type: StringType,
    },
    info: {
      type: StringType,
    },
    createdAt: {
      type: StringType,
    },
  },
});
const User = new ObjectType({
  name: 'user',
  fields: {
    id: {
      type: StringType,
      resolve(user) {
        return user.id;
      },
    },
    email: {
      type: StringType,
      resolve(user) {
        return user.email;
      },
    },
    profile: {
      type: Profile,
      resolve(user) {
        return user.getProfile();
      },
    },
    verification: {
      type: UserVerifiedInfoType,
      resolve(user) {
        return user.getUserVerifiedInfo();
      },
    },
    userBanStatus: {
      type: IntType,
      resolve(user) {
        return user.userBanStatus;
      },
    },
    userDeletedAt: {
      type: StringType,
      resolve(user) {
        return user.userDeletedAt;
      },
    },
  },
});
const ListSettingsTypes = new ObjectType({
  name: 'listSettingsTypes',
  fields: {
    id: { type: IntType },
    typeName: { type: StringType },
    typeLabel: { type: StringType },
    step: { type: StringType },
    fieldType: { type: StringType },
    isEnable: { type: StringType },
    status: { type: StringType },
  },
});
const ListSettings = new ObjectType({
  name: 'listSettings',
  fields: {
    id: { type: IntType },
    typeId: { type: IntType },
    itemName: { type: StringType },
    itemDescription: { type: StringType },
    otherItemName: { type: StringType },
    maximum: { type: IntType },
    minimum: { type: IntType },
    startValue: { type: IntType },
    endValue: { type: IntType },
    isEnable: { type: StringType },
    image: { type: StringType },
    settingsType: {
      type: ListSettingsTypes,
      resolve(listSettings) {
        return listSettings.getListSettingsTypes();
      },
    },
  },
});
const UserAmenities = new ObjectType({
  name: 'userAmenities',
  fields: {
    amenitiesId: {
      type: StringType,
      resolve(userAmenities) {
        return userAmenities.amenitiesId;
      },
    },
    listsettings: {
      type: ListSettings,
      resolve(userAmenities) {
        return userAmenities.getListSettings();
      },
    },
  },
});
const UserSafetyAmenities = new ObjectType({
  name: 'userSafetyAmenities',
  fields: {
    safetyAmenitiesId: {
      type: StringType,
      resolve(userSafetyAmenities) {
        return userSafetyAmenities.safetyAmenitiesId;
      },
    },
    listsettings: {
      type: ListSettings,
      resolve(userSafetyAmenities) {
        return userSafetyAmenities.getListSettings();
      },
    },
  },
});
// Spaces
const UserSpaces = new ObjectType({
  name: 'userSpaces',
  fields: {
    spacesId: {
      type: StringType,
      resolve(userSpaces) {
        return userSpaces.spacesId;
      },
    },
    listsettings: {
      type: ListSettings,
      resolve(userSpaces) {
        return userSpaces.getListSettings();
      },
    },
  },
});
// House Rules
const UserHouseRules = new ObjectType({
  name: 'userHouseRules',
  fields: {
    id: {
      type: IntType,
    },
    houseRulesId: {
      type: StringType,
      resolve(userHouseRules) {
        return userHouseRules.houseRulesId;
      },
    },
    listsettings: {
      type: ListSettings,
      resolve(userHouseRules) {
        return userHouseRules.getListSettings();
      },
    },
  },
});

// Spaces
const ListBedTypes = new ObjectType({
  name: 'listBedTypes',
  fields: {
    bedType: {
      type: IntType,
      resolve(listBedTypes) {
        return listBedTypes.bedType;
      },
    },
    listsettings: {
      type: ListSettings,
      resolve(listBedTypes) {
        return listBedTypes.getListSettings();
      },
    },
  },
});

// List Blocked Dates
const ListBlockedDatesValue = new ObjectType({
  name: 'listBlockedDates',
  fields: {
    blockedDates: {
      type: StringType,
      resolve(listBlockedDates) {
        return listBlockedDates.blockedDates;
      },
    },
    reservationId: {
      type: IntType,
      resolve(listBlockedDates) {
        return listBlockedDates.reservationId;
      },
    },
    calendarStatus: {
      type: StringType,
      resolve(listBlockedDates) {
        return listBlockedDates.calendarStatus;
      },
    },
    isSpecialPrice: {
      type: FloatType,
      resolve(listBlockedDates) {
        return listBlockedDates.isSpecialPrice;
      },
    },
  },
});
// Listing More Data
const ListingData = new ObjectType({
  name: 'listingData',
  fields: {
    bookingNoticeTime: { type: StringType },
    checkInStart: { type: StringType },
    checkInEnd: { type: StringType },
    maxDaysNotice: { type: StringType },
    minNight: { type: IntType },
    maxNight: { type: IntType },
    minNightRepost: { type: IntType },
    maxNightRepost: { type: IntType },
    minNightSwap: { type: IntType },
    maxNightSwap: { type: IntType },
    basePrice: { type: FloatType },
    cleaningPrice: { type: FloatType },
    cleaningPriceMaxDays: { type: IntType },
    currency: { type: StringType },
    weeklyDiscount: { type: IntType },
    monthlyDiscount: { type: IntType },
    cancellationPolicy: { type: IntType },
    cancellation: {
      type: CancellationType,
      resolve(listingData) {
        return Cancellation.findOne({
          where: {
            id: listingData.cancellationPolicy,
            isEnable: true,
          },
        });
      },
    },
    taxRate: { type: FloatType },
  },
});
// User Listing Data
const UserListingData = new ObjectType({
  name: 'userListingData',
  fields: {
    id: {
      type: IntType,
      resolve(userListingData) {
        return userListingData.id;
      },
    },
    settingsId: {
      type: IntType,
      resolve(userListingData) {
        return userListingData.settingsId;
      },
    },
    listsettings: {
      type: ListSettings,
      resolve(userListingData) {
        return userListingData.getListSettings();
      },
    },
  },
});
// Listing Steps
const UserListingSteps = new ObjectType({
  name: 'userListingSteps',
  fields: {
    id: { type: IntType },
    listId: { type: IntType },
    step1: { type: StringType },
    step2: { type: StringType },
    step3: { type: StringType },
    step4: { type: StringType },
    currentStep: { type: IntType },
    status: { type: StringType },
  },
});
// Recommended Listing
const Recommend = new ObjectType({
  name: 'recommend',
  fields: {
    id: { type: IntType },
    listId: { type: IntType },
    status: { type: StringType },
  },
});
// Listing Photos
const ListPhotosType = new ObjectType({
  name: 'listPhotos',
  fields: {
    id: { type: IntType },
    listId: { type: IntType },
    name: { type: StringType },
    type: { type: StringType },
    status: { type: StringType },
    review: { type: BooleanType},
  },
});
const ListdescriptionType = new ObjectType({
  name: 'ListdescriptionType',
  fields: {
    id: { type: IntType },
    description: { type: StringType },
    listId: { type: IntType },
    bedRoomNumber: { type: IntType },
  },
});
const RepostFixedPriceType = new ObjectType({
  name: 'repostFixedPrice',
  fields: {
    id: { type: IntType },
    repostId: { type: IntType },
    from: { type: StringType },
    to: { type: StringType },
    price: { type: FloatType },
  },
});
const Reposts = new ObjectType({
  name: 'reposts',
  fields: {
    id: { type: IntType },
    userId: { type: StringType },
    startDate: { type: StringType },
    endDate: { type: StringType },
    newNightPrice: { type: FloatType },
    fixedPrice: { type: List(RepostFixedPriceType) },
  },
});
const ShareReservation = new ObjectType({
  name: 'ShareReservation',
  fields: {
    id: { type: IntType },
    listId: { type: IntType },
    checkIn: { type: StringType },
    checkOut: { type: StringType },
    subguests: { type: IntType },
  },
});
const ShowListingType = new ObjectType({
  name: 'ShowListing',
  fields: {
    id: { type: IntType },
    userId: { type: StringType },
    title: { type: StringType },
    description: { type: StringType },    
    additionalTitle: { type: StringType },
    additionalDescription: { type:StringType },
    bedrooms: { type: StringType },
    bedroomsDescription: {
      type: new List(ListdescriptionType),
      async resolve(listing) {
        const descriptionList = await Bedrooms.findAll({
          where: {
            listId: listing.id,
            },
          });
       return descriptionList;
      }
    },
    residenceType: { type: StringType },
    buildingSize: { type: StringType },
    beds: { type: IntType },
    personCapacity: { type: IntType },
    bathrooms: { type: FloatType },
    country: { type: StringType },
    street: { type: StringType },
    buildingName: { type: StringType },
    city: { type: StringType },
    state: { type: StringType },
    zipcode: { type: StringType },
    lat: { type: FloatType },
    lng: { type: FloatType },
    newNightPrice: { type: FloatType },
    isRepostAllowed: { type: BooleanType },
    maxRepostPercentage: { type: IntType },
    isSwapAllowed: { type: BooleanType },
    swapAllowAnyDate: { type: BooleanType },
    availableShare: {
      type: new List(ShareReservation),
      async resolve(listing) {
        const reservations = await sequelize.query(
          ` SELECT DISTINCT
              Reservation.*,
              (
                SELECT COUNT(1) 
                FROM SubguestDetail 
                WHERE 
                SubguestDetail.reservationId = Reservation.id AND
                  SubguestDetail.status LIKE 'pending' AND
                  SubguestDetail.subguestId IS NULL
              ) as subguests
            FROM Reservation
            WHERE 
              Reservation.listId = ${listing.id} AND
              Reservation.isPublic = 1 AND
              Reservation.reservationState IN ('pending', 'approved') AND
              EXISTS (
                SELECT 1 
                FROM SubguestDetail
                WHERE 
                  Reservation.id = SubguestDetail.reservationId AND
                  SubguestDetail.status LIKE 'pending' AND
                  SubguestDetail.subguestId IS NULL
              )
          `,
        );

        return reservations[0];
      },
    },
    swapStartDate: { type: StringType },
    swapEndDate: { type: StringType },
    swapCountryCode: { type: StringType },
    swapCountryName: { type: StringType },
    swapCity: { type: StringType },
    reposts: {
      type: List(Reposts),
      async resolve(listing) {
        const reposts = [...listing.reposts];
        for (let i = 0; i < reposts.length; i++) {
          const repost = reposts[i];
          const repostsFixedPrice = await RepostFixedPrice.findAll({
            attributes: ['id', 'repostId', 'from', 'to', 'price'],
            where: {
              repostId: repost.id,
            },
            raw: true,
          });
          if (repostsFixedPrice.length > 0) {
            reposts[i].fixedPrice = repostsFixedPrice;
          } else {
            reposts[i].fixedPrice = [];
          }
        }
        return reposts;
      },
    },
    coverPhoto: { type: IntType },
    additionalCoverPhoto: { type: IntType },
    reviewed: { type: BooleanType },
    listPhotos: {
      type: new List(ListPhotosType),
      async resolve(listing) {
        const newList = await ListPhotos.findAll({
          where: {
            listId: listing.id,        
            review: true,
            },
          });
       return newList;
        //return listing.getById(listing.coverPhoto)
      },
    },
    allListPhotos: {
      type: new List(ListPhotosType),
      resolve(listing) {
       return listing.getListPhotos();
      },
    },
    isMapTouched: { type: BooleanType },
    bookingType: { type: StringType },
    isAccepted: { type: BooleanType },
    startAvailableDate: { type: StringType },
    isPublished: { type: BooleanType },
    listApprovalStatus: { type: StringType },
    isReady: { type: BooleanType },
    status: { type: StringType },
    updatedAt: { type: StringType },
    createdAt: { type: StringType },
    count: { type: IntType },
    user: {
      type: User,
      resolve(listing) {
        return listing.getUser();
      },
    },
    userAmenities: {
      type: new List(UserAmenities),
      resolve(listing) {
        return listing.getUserAmenities();
      },
    },
    userSafetyAmenities: {
      type: new List(UserSafetyAmenities),
      resolve(listing) {
        return listing.getUserSafetyAmenities();
      },
    },
    userSpaces: {
      type: new List(UserSpaces),
      resolve(listing) {
        return listing.getUserSpaces();
      },
    },
    settingsData: {
      type: new List(UserListingData),
      resolve(listing) {
        return listing.getUserListingData();
      },
    },
    houseRules: {
      type: new List(UserHouseRules),
      resolve(listing) {
        return listing.getUserHouseRules();
      },
    },
    listBedTypes: {
      type: new List(ListBedTypes),
      resolve(listing) {
        return listing.getBedTypes();
      },
    },
    listingData: {
      type: ListingData,
      resolve(listing) {
        return listing.getListingData();
      },
    },
    // blockedDates: {
    //   type: new List(ListBlockedDatesValue),
    //   async resolve(listing) {
    //     return await listing.getListBlockedDates();
    //   }
    // },
    //new
    blockedDates: {
      type: new List(ListBlockedDatesType),
      async resolve(listBlock) {
        let today = getDateUsingTimeZone(listBlock.country, false);
        return await ListBlockedDates.findAll({
          where: {
            listId: listBlock.id,
            blockedDates: {
              $gte: today.format('YYYY-MM-DD'),
            },
          },
        });
      },
    },
    blockedDatesReposts: {
      type: new List(ListBlockedDatesType),
      async resolve(listing) {
        try {
          let today = getDateUsingTimeZone(listing.country, false);
          const blockedDates = await ListBlockedDates.findAll({
            where: {
              listId: listing.id,
              blockedDates: {
                $gte: today.format('YYYY-MM-DD'),
              },
            },
            raw: true,
          });

          const blockedDatesReposts = [];
          for (let i = 0; i < listing.reposts.length; i++) {
            const oneRepost = listing.reposts[i];
            const momentStartDate = moment(
              moment(oneRepost.startDate).format('YYYY-MM-DD'),
            );
            const momentEndDate = moment(
              moment(oneRepost.endDate).format('YYYY-MM-DD'),
            );
            const dayDifference = momentEndDate.diff(momentStartDate, 'days');
            if (dayDifference > 0) {
              for (let i = 0; i < dayDifference; i++) {
                let currentDate = moment(oneRepost.startDate)
                  .add(i, 'day')
                  .format('YYYY-MM-DD');
                blockedDatesReposts.push({
                  blockedDates: currentDate,
                  calendarStatus: 'blocked',
                });
              }
            }
          }
          const newBlockedDates = blockedDates.map(blockedDate => {
            return {
              blockedDates: moment(blockedDate.blockedDates).format(
                'YYYY-MM-DD',
              ),
              calendarStatus: blockedDate.calendarStatus,
              isSpecialPrice: blockedDate.isSpecialPrice,
            };
          });
          const finalBlockedDatesReposts = [
            ...newBlockedDates,
            ...blockedDatesReposts,
          ];
          return finalBlockedDatesReposts;
        } catch (error) {
          console.log('error : ', error);
          return [];
        }
      },
    },
    blockedDatesRepostsSwaps: {
      type: new List(ListBlockedDatesType),
      async resolve(listing) {
        try {
          let today = getDateUsingTimeZone(listing.country, false);
          const blockedDates = await ListBlockedDates.findAll({
            where: {
              listId: listing.id,
              blockedDates: {
                $gte: today.format('YYYY-MM-DD'),
              },
            },
            raw: true,
          });

          const blockedDatesRepostsSwaps = [];
          for (let i = 0; i < listing.reposts.length; i++) {
            const oneRepost = listing.reposts[i];
            const momentStartDate = moment(
              moment(oneRepost.startDate).format('YYYY-MM-DD'),
            );
            const momentEndDate = moment(
              moment(oneRepost.endDate).format('YYYY-MM-DD'),
            );
            const dayDifference = momentEndDate.diff(momentStartDate, 'days');
            if (dayDifference > 0) {
              for (let i = 0; i < dayDifference; i++) {
                let currentDate = moment(oneRepost.startDate)
                  .add(i, 'day')
                  .format('YYYY-MM-DD');
                blockedDatesRepostsSwaps.push({
                  blockedDates: currentDate,
                  calendarStatus: 'blocked',
                  isSpecialPrice: 0,
                  reservationId: null,
                });
              }
            }
          }
          if (listing.swapStartDate && listing.swapEndDate) {
            const momentStartDate = moment(
              moment(listing.swapStartDate).format('YYYY-MM-DD'),
            );
            const momentEndDate = moment(
              moment(listing.swapEndDate).format('YYYY-MM-DD'),
            );
            const dayDifference = momentEndDate.diff(momentStartDate, 'days');
            if (dayDifference > 0) {
              for (let i = 0; i < dayDifference; i++) {
                let currentDate = moment(listing.swapStartDate)
                  .add(i, 'day')
                  .format('YYYY-MM-DD');
                blockedDatesRepostsSwaps.push({
                  blockedDates: currentDate,
                  calendarStatus: 'blocked',
                  isSpecialPrice: 0,
                  reservationId: null,
                });
              }
            }
          }
          const newBlockedDates = blockedDates.map(blockedDate => {
            return {
              blockedDates: moment(blockedDate.blockedDates).format(
                'YYYY-MM-DD',
              ),
              calendarStatus: blockedDate.calendarStatus,
              isSpecialPrice: blockedDate.isSpecialPrice,
            };
          });
          const finalBlockedDatesRepostsSwaps = [
            ...newBlockedDates,
            ...blockedDatesRepostsSwaps,
          ];
          return finalBlockedDatesRepostsSwaps;
        } catch (error) {
          console.log('error : ', error);
          return [];
        }
      },
    },
    listingSteps: {
      type: UserListingSteps,
      resolve(listing) {
        return listing.getUserListingSteps();
      },
    },
    recommend: {
      type: Recommend,
      resolve(listing) {
        return listing.getRecommend();
      },
    },
    reviewsCount: {
      type: IntType,
      async resolve(listing) {
        return await Reviews.count({
          where: {
            listId: listing.id,
            userId: listing.userId,
            isAdminEnable: true,
          },
        });
      },
    },
    reviewsStarRating: {
      type: FloatType,
      async resolve(listing) {
        return await Reviews.sum('rating', {
          where: {
            listId: listing.id,
            userId: listing.userId,
            isAdminEnable: true,
          },
        });
      },
    },
    reviews: {
      type: new List(ReviewsType),
      async resolve(listing) {
        return await Reviews.findAll({
          where: {
            listId: listing.id,
            userId: listing.userId,
            isAdminEnable: true,
          },
          order: [['createdAt', 'DESC']],
          limit: 1,
        });
      },
    },
    calendars: {
      type: new List(ListCalendarType),
      async resolve(listing) {
        return await ListCalendar.findAll({
          where: {
            listId: listing.id,
          },
        });
      },
    },
    wishListStatus: {
      type: BooleanType,
      async resolve(listing, {}, request) {
        let userId = request && request.user ? request.user.id : undefined;
        let count = await WishList.count({
          where: {
            listId: listing.id,
            userId,
          },
        });
        return count ? true : false;
      },
    },
    isListOwner: {
      type: BooleanType,
      async resolve(listing, {}, request) {
        let userId = request && request.user ? request.user.id : undefined;
        let count = await Listing.count({
          where: {
            id: listing.id,
            userId,
          },
        });
        return count ? true : false;
      },
    },
    userBedsTypes: {
      type: new List(UserBedTypes),
      async resolve(bedtypes) {
        return await BedTypes.findAll({
          where: {
            listId: bedtypes.id,
          },
        });
      },
    },
    listBlockedPrice: {
      type: new List(ListBlockedDatesType),
      async resolve(listBlock) {
        return await ListBlockedDates.findAll({
          where: {
            listId: listBlock.id,
            calendarStatus: 'available',
          },
        });
      },
    },
    submittedOn: {
      type: ListingHistoryType,
      async resolve(list) {
        return await ListingPermissionHistory.findOne({
          where: {
            listId: list.id,
            status: 'submitForverification',
          },
          order: [['createdAt', 'DESC']],
          limit: 1,
        });
      },
    },
    listingHistory: {
      type: new List(ListingHistoryType),
      async resolve(list) {
        return await ListingPermissionHistory.findAll({
          attributes: ['status', 'createdAt', 'reason'],
          where: {
            listId: list.id,
            status: 'declined',
          },
          order: [['createdAt', 'DESC']],
        });
      },
    },
    userBedrooms: {
      type: new List(BedroomType),
    },
  },
});
export default ShowListingType;
