// GrpahQL
import {
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLNonNull as NonNull,
} from 'graphql';
import { blockSwapDates } from '../../core/payment/stripe/helpers/blockSwapDates';
import { checkAvailableListing } from '../../helpers/checkAvailableListing';

import { Swap } from '../models';
import SwapType from '../types/SwapType';

const updateSwap = {
  type: SwapType,

  args: {
    swapId: { type: new NonNull(IntType) },
    swapStatus: { type: new NonNull(StringType) },
    reservationId: { type: IntType },
    couponAmount: { type: StringType },
    couponCurrency: { type: StringType },
    couponType: { type: StringType },
  },

  async resolve(source, { swapId, swapStatus, reservationId, couponAmount, couponCurrency, couponType }, { request, response } , cccc) {
    // Check if user already logged in
    if (request.user) {
      const userId = request.user.id;
      let finalSwapStatus = swapStatus;
      if (finalSwapStatus === 'accepted' || finalSwapStatus === 'payIn') {
        const swap = await Swap.findOne({
          attributes: [
            'id',
            'hostId',
            'guestId',
            'hostListId',
            'guestListId',
            'checkIn',
            'checkOut',
            'swapStatus',
            'swapTotal',
          ],
          where: {
            id: swapId,
          },
          raw: true,
        });
        if (swap) {
          const swapUserType = swap.hostId === userId ? 'host' : 'guest';

          const isAvailable = await checkAvailableListing(
            swap.hostListId,
            swap.checkIn,
            swap.checkOut,
            'blockedDates-reposts-swaps',
            finalSwapStatus === 'payIn' && reservationId ? reservationId : null,
          );
          if (!isAvailable) {
            return {
              status:
                swapUserType === 'host'
                  ? 'notAvailableDates'
                  : 'notAvailableDatesGuest',
            };
          }

          const isAvailableGuest = await checkAvailableListing(
            swap.guestListId,
            swap.checkIn,
            swap.checkOut,
            'blockedDates-reposts-swaps',
          );
          if (!isAvailableGuest) {
            return {
              status:
                swapUserType === 'host'
                  ? 'notAvailableDatesGuest'
                  : 'notAvailableDates',
            };
          }

          if (swap.swapTotal && finalSwapStatus === 'accepted') {
            finalSwapStatus = 'payIn';
          } else if (finalSwapStatus === 'payIn' && reservationId) {
            finalSwapStatus = 'accepted';
          }
        }        
      }
      // return {
      //   status: 'test',
      // };
      const updatedSwap = await Swap.update(
        {
          swapStatus: finalSwapStatus,
          couponAmount: couponAmount || null,
          couponCurrency: couponCurrency || null,
          couponType: couponType || null,
        },
        {
          where: {
            id: swapId,
            // hostId: userId,
          },
        },
      );
      if (finalSwapStatus === 'accepted') {
        await blockSwapDates(swapId, reservationId);
      }
      return {
        swapStatus: finalSwapStatus,
        status: '200',
      };
    } else {
      return {
        status: 'notLoggedIn',
      };
    }
  },
};

export default updateSwap;
