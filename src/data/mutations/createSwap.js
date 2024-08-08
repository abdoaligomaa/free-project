// GrpahQL
import {
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLBoolean as BooleanType,
  GraphQLNonNull as NonNull,
} from 'graphql';

import { Swap, Listing, Threads, ThreadItems } from '../models';
import SwapType from '../types/SwapType';
import moment from 'moment';
import { checkAvailableListing } from '../../helpers/checkAvailableListing';

const createSwap = {
  type: SwapType,

  args: {
    hostId: { type: new NonNull(StringType) },
    checkIn: { type: new NonNull(StringType) },
    checkOut: { type: new NonNull(StringType) },
    hostListId: { type: new NonNull(IntType) },
    guestListId: { type: new NonNull(IntType) },
    message: { type: new NonNull(StringType) },
    swapCountry: { type: StringType },
    swapDatesSelected: { type: IntType },
    swapStayedNights: { type: IntType },
    swapIsSpecialPriceAssigned: { type: BooleanType },
    swapIsAverage: { type: StringType },
    swapCurrency: { type: StringType },
    swapDayDifference: { type: IntType },
    swapIsDayTotal: { type: StringType },
    swapDiscount: { type: StringType },
    swapDiscountType: { type: StringType },
    swapCleaningPrice: { type: StringType },
    swapServiceFee: { type: StringType },
    swapTotal: { type: StringType },
  },

  async resolve(source,{
      hostId,
      checkIn,
      checkOut,
      hostListId,
      guestListId,
      message,
      swapCountry,
      swapDatesSelected,
      swapStayedNights,
      swapIsSpecialPriceAssigned,
      swapIsAverage,
      swapCurrency,
      swapDayDifference,
      swapIsDayTotal,
      swapDiscount,
      swapDiscountType,
      swapCleaningPrice,
      swapServiceFee,
      swapTotal
    }, { request, response }, ccc) {
    // Check if user already logged in
    if (request.user) {
      const guestId = request.user.id;
      const checkInFormated = moment(checkIn).format('YYYY-MM-DD');
      const checkOutFormated = moment(checkOut).format('YYYY-MM-DD');
      const checkGuestList = await Listing.findOne({
        where: {
          id: guestListId,
          userId: guestId,
        },
      });

      if (checkGuestList) {
        const isAvailableGuest = await checkAvailableListing(guestListId, checkInFormated, checkOutFormated, 'blockedDates-reposts-swaps');        
        if (!isAvailableGuest) {
          return {
            status: 'notAvailableDates',
          };
        }
        const isAvailableHost = await checkAvailableListing(hostListId, checkInFormated, checkOutFormated, 'blockedDates-reposts-swaps');        
        if (!isAvailableHost) {
          return {
            status: 'notAvailableDatesHost',
          };
        }
        const swap = {
          hostId: hostId,
          guestId: guestId,
          hostListId: hostListId,
          guestListId: guestListId,
          checkIn: checkInFormated,
          checkOut: checkOutFormated,
          swapCountry: swapCountry,
          swapDatesSelected: swapDatesSelected,
          swapStayedNights: swapStayedNights,
          swapIsSpecialPriceAssigned: swapIsSpecialPriceAssigned,
          swapIsAverage: swapIsAverage,
          swapCurrency: swapCurrency,
          swapDayDifference: swapDayDifference,
          swapIsDayTotal: swapIsDayTotal,
          swapDiscount: swapDiscount,
          swapDiscountType: swapDiscountType,
          swapCleaningPrice: swapCleaningPrice,
          swapServiceFee: swapServiceFee,
          swapTotal: swapTotal
        };
        const createdSwap = await Swap.create(swap);
        if (createdSwap) {
          const createThreads = await Threads.create({
            listId: hostListId,
            swapId: createdSwap.id,
            swapHostListId: hostListId,
            swapGuestListId: guestListId,
            host: hostId,
            guest: guestId,
            isRead: false,
            messageUpdatedDate:  new Date()
          });
          if (createThreads) {
            await ThreadItems.create({
              threadId: createThreads.id,
              sentBy: guestId,
              content: message,
              type: 'message',
              startDate: checkInFormated,
              endDate: checkOutFormated,
              isRead: false,
            });
          }
          return createdSwap;
        }
      } else {
        return {
          status: 'user do not have any listings',
        };
      }
    } else {
      return {
        status: 'notLoggedIn',
      };
    }
  },
};

export default createSwap;
