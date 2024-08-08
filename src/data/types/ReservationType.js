import {
  GraphQLObjectType as ObjectType,
  GraphQLID as ID,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLFloat as FloatType,
  GraphQLList as List,
  GraphQLBoolean as BooleanType,
} from 'graphql';

import moment from 'moment';

// Models
import {
  Listing,
  UserProfile,
  Threads,
  Payout,
  TransactionHistory,
  Transaction,
  CancellationDetails,
  User,
  ThreadItems,
  Cancellation,
  ReservationSpecialPricing,
  FailedTransactionHistory,
  Subguest,
  SubguestDetail,
} from '../models';

// Type
import ThreadsType from './ThreadsType';
import ShowListingType from './ShowListingType';
import ProfileEncryptType from './ProfileEncryptType';
import PayoutType from './PayoutType';
import TransactionHistoryType from './TransactionHistoryType';
import TransactionType from './TransactionType';
import CancellationDetailsType from './CancellationDetailsType';
import UserType from './UserType';
import ThreadItemsType from './ThreadItemsType';
import CancellationType from './CancellationType';
import ReservationSpecialPricingType from './ReservationSpecialPricingType';
import FailedTransactionHistoryType from './FailedTransactionHistoryType';
import SplitAndShareDataType from './SplitAndShareDataType';

import { encode } from '../../helpers/queryEncryption';
import { getItineraryUsersInfo } from '../../helpers/getItineraryUsersInfo';

const ReservationType = new ObjectType({
  name: 'Reservation',
  fields: {
    id: {
      type: IntType,
    },
    listId: {
      type: IntType,
    },
    listData: {
      type: ShowListingType,
      resolve(reservation) {
        return Listing.findOne({
          where: { id: reservation.listId },
          // raw: true
        });
      },
    },
    hostId: {
      type: StringType,
    },
    swapId: {
      type: IntType,
    },
    hostPayout: {
      type: PayoutType,
      resolve(reservation) {
        if (reservation.payoutId != null && reservation.payoutId > 0) {
          return Payout.findOne({
            where: {
              userId: reservation.hostId,
              id: reservation.payoutId,
            },
            // raw: true
          });
        } else {
          return Payout.findOne({
            where: {
              userId: reservation.hostId,
              default: true,
            },
            // raw: true
          });
        }
      },
    },
    hostTransaction: {
      type: TransactionHistoryType,
      resolve(reservation) {
        return TransactionHistory.findOne({
          where: {
            reservationId: reservation.id,
          },
          // raw: true
        });
      },
    },
    hostFailedTransaction: {
      type: FailedTransactionHistoryType,
      resolve(reservation) {
        return FailedTransactionHistory.findOne({
          where: {
            reservationId: reservation.id,
          },
        });
      },
    },
    hostData: {
      type: ProfileEncryptType,
      async resolve(reservation) {
        let hostData = await UserProfile.findOne({
          where: { userId: reservation.hostId },
          raw: true,
        });
        let phoneNumberEncrypt = { phoneNumber: encode(hostData.phoneNumber) };

        return await { ...hostData, ...phoneNumberEncrypt };
      },
    },
    guestId: {
      type: StringType,
    },
    guestData: {
      type: ProfileEncryptType,
      async resolve(reservation) {
        let guestData = await UserProfile.findOne({
          where: { userId: reservation.guestId },
          raw: true,
        });

        let phoneNumberEncrypt = { phoneNumber: encode(guestData.phoneNumber) };

        return await { ...guestData, ...phoneNumberEncrypt };
      },
    },
    transaction: {
      type: TransactionType,
      resolve(reservation) {
        return Transaction.findOne({
          where: { reservationId: reservation.id, paymentType: 'booking' },
          // raw: true
        });
      },
    },
    refundStatus: {
      type: TransactionType,
      resolve(reservation) {
        return Transaction.findOne({
          where: { reservationId: reservation.id, paymentType: 'cancellation' },
          // raw: true
        });
      },
    },
    guestUser: {
      type: UserType,
      resolve(reservation) {
        return User.findOne({
          where: { Id: reservation.guestId },
          // raw: true
        });
      },
    },
    hostUser: {
      type: UserType,
      resolve(reservation) {
        return User.findOne({
          where: { Id: reservation.hostId },
          // raw: true
        });
      },
    },
    checkIn: {
      type: StringType,
    },
    checkOut: {
      type: StringType,
    },
    guests: {
      type: IntType,
    },
    message: {
      type: StringType,
    },
    basePrice: {
      type: FloatType,
    },
    cleaningPrice: {
      type: FloatType,
    },
    currency: {
      type: StringType,
    },
    discount: {
      type: FloatType,
    },
    discountType: {
      type: StringType,
    },
    guestServiceFee: {
      type: FloatType,
    },
    hostServiceFee: {
      type: FloatType,
    },
    total: {
      type: FloatType,
    },
    confirmationCode: {
      type: IntType,
    },
    reservationState: {
      type: StringType,
    },
    paymentState: {
      type: StringType,
    },
    payoutId: {
      type: IntType,
    },
    isHold: {
      type: BooleanType,
    },
    paymentAttempt: {
      type: IntType,
    },
    messageData: {
      type: ThreadsType,
      resolve(reservation) {
        return Threads.findOne({
          where: {
            listId: reservation.listId,
            $or: [
              {
                host: reservation.guestId,
              },
              {
                guest: reservation.guestId,
              },
            ],
          },
          // raw: true
        });
      },
    },
    cancellationDetails: {
      type: CancellationDetailsType,
      resolve(reservation) {
        return CancellationDetails.findOne({
          where: {
            reservationId: reservation.id,
          },
          // raw: true
        });
      },
    },
    createdAt: {
      type: StringType,
    },
    updatedAt: {
      type: StringType,
    },
    count: {
      type: IntType,
    },
    status: {
      type: StringType,
    },
    errorMessage: {
      type: StringType,
    },
    paymentMethodId: {
      type: IntType,
    },
    threadData: {
      type: ThreadItemsType,
      resolve(reservation) {
        return ThreadItems.findOne({
          where: {
            reservationId: reservation.id,
          },
          // raw: true
        });
      },
    },
    cancellationPolicy: {
      type: IntType,
    },
    cancellation: {
      type: CancellationType,
      resolve(reservation) {
        return Cancellation.findOne({
          where: {
            id: reservation.cancellationPolicy,
            isEnable: true,
          },
          // raw: true
        });
      },
    },
    bookingSpecialPricing: {
      type: new List(ReservationSpecialPricingType),
      async resolve(reservation) {
        let convertedResponse = [];
        const listingSpecialPricingData =
          await ReservationSpecialPricing.findAll({
            where: {
              reservationId: reservation.id,
            },
            order: [['blockedDates', 'ASC']],
            // raw: true
          });

        if (listingSpecialPricingData && listingSpecialPricingData.length > 0) {
          listingSpecialPricingData.map(item => {
            convertedResponse.push({
              id: item.id,
              listId: item.listId,
              reservationId: item.reservationId,
              blockedDates: moment(item.blockedDates)
                .utc()
                .format('MM/DD/YYYY'),
              isSpecialPrice: item.isSpecialPrice,
            });
          });
          return convertedResponse;
        } else {
          return [];
        }
      },
    },
    isSpecialPriceAverage: {
      type: FloatType,
    },

    dayDifference: {
      type: FloatType,
    },
    taxRate: { type: FloatType },
    checkInStart: {
      type: StringType,
    },
    checkInEnd: {
      type: StringType,
    },
    hostServiceFeeType: {
      type: StringType,
    },
    hostServiceFeeValue: {
      type: FloatType,
    },
    bookingType: {
      type: StringType,
    },
    isPublic: {
      type: BooleanType,
    },
    splitAndShare: {
      type: BooleanType,
    },
    splitAndShareData: {
      type: new List(SplitAndShareDataType),
      async resolve(reservation) {
        let splitAndShareData = [];
        await SubguestDetail.findAll({
          where: {
            reservationId: reservation.id,
          },
          include: [
            {
              model: Subguest,
              where: {
                reservationId: reservation.id,
              },
              required: false,
            },
          ],
        }).then(data => {
          if (data && data.length > 0) {
            data.map(item => {
              splitAndShareData.push({
                id: item.id,
                status: item.status,
                spotStatus: item.spotStatus,
                bed: item.bed,
                amount: item.amount,
                email: item.Subguest ? item.Subguest.email : null,
                subguestId: item.subguestId,
                reservationId: item.reservationId,
                userId: item.Subguest ? item.Subguest.userId : null,
              });
            });
          }
        });
        const newSplitAndShareData = await getItineraryUsersInfo(
          splitAndShareData,
        );
        return newSplitAndShareData;
      },
    },
    couponId: {
      type: IntType,
    }
  },
});

export default ReservationType;
