import moment from "moment";
import { ListBlockedDates, Listing, Repost, Swap } from "../data/models";

export async function checkAvailableListing(listId, startDateFormatted, endDateFormatted, type, reservationId) {
  const today = moment().format("YYYY-MM-DD");
  const startDate = moment(startDateFormatted);
  const endDate = moment(endDateFormatted);
  let isAvailable = true;
  if (type.includes('blockedDates')) {
    const where = {
      listId: listId,
      calendarStatus: 'blocked',
      blockedDates: {
        $gte: today,
      },
    };
    if (reservationId) where.reservationId = {
      $ne: reservationId
    }
    const blockedDates = await ListBlockedDates.findAll({
      attributes: ['id', 'blockedDates', 'calendarStatus'],
      where,
      raw: true,
    });
    
    if (blockedDates.length > 0) {
      for (let index = 0; index < blockedDates.length; index++) {
        const element = blockedDates[index];
        const blockedDate = moment(element.blockedDates);
        if (blockedDate.isSameOrAfter(startDate) && blockedDate.isSameOrBefore(endDate)) {
          isAvailable = false;
          break;
        }
      }
    }
  }  
  
  if (isAvailable === true && type.includes('reposts')) {
    const reposts = await Repost.findAll({
      attributes: ['id', 'start_date', 'end_date'],
      where: {
        listing_id: listId,
        payment_status: 'completed'
      },
      raw: true,
    });
    
    if (reposts.length > 0) {
      for (let i = 0; i < reposts.length; i++) {
        const oneRepost = reposts[i];
        const momentStartDate = moment(oneRepost.start_date);
        const momentEndDate = moment(oneRepost.end_date);
        const dayDifference = momentEndDate.diff(momentStartDate, 'days');
        if (dayDifference > 0) {
          for (let i = 0; i < dayDifference; i++) {
            let currentDate = moment(oneRepost.start_date).add(i, 'day');
            if (currentDate.isSameOrAfter(startDate) && currentDate.isSameOrBefore(endDate)) {
              isAvailable = false;
              break;
            }
          }
        }
      }
    }
  }

  if (type.includes('swapDates')) {
    const swapDates = await Listing.findAll({
      attributes: ['id', 'swapStartDate', 'swapEndDate'],
      where: {
        id: listId,
        isSwapAllowed: true,
        swapStartDate: {
          $ne: null
        },
        swapEndDate: {
          $ne: null
        },
      },
      raw: true,
    });
    
    if (swapDates.length > 0) {
      for (let index = 0; index < swapDates.length; index++) {
        const element = swapDates[index];
        const momentStartDate = moment(element.swapStartDate);
        const momentEndDate = moment(element.swapEndDate);
        const dayDifference = momentEndDate.diff(momentStartDate, 'days');
        if (dayDifference > 0) {
          for (let i = 0; i < dayDifference; i++) {
            let currentDate = moment(element.swapStartDate).add(i, 'day');
            if (currentDate.isSameOrAfter(startDate) && currentDate.isSameOrBefore(endDate)) {
              isAvailable = false;
              break;
            }
          }
        }
      }
    }
  }

  if (isAvailable === true && type.includes('swaps')) {
    const swaps = await Swap.findAll({
      attributes: ['id', 'checkIn', 'checkOut'],
      where: {
        $or: [
          {
            hostListId: listId,
          },
          {
            guestListId: listId,
          },
        ],
        checkIn: {
          $ne: null
        },
        checkOut: {
          $ne: null
        },
        swapStatus: 'accepted'
      },
      raw: true,
    });
    if (swaps.length > 0) {
      for (let i = 0; i < swaps.length; i++) {
        const oneSwap = swaps[i];
        const momentStartDate = moment(oneSwap.checkIn);
        const momentEndDate = moment(oneSwap.checkOut);
        const dayDifference = momentEndDate.diff(momentStartDate, 'days');
        if (dayDifference > 0) {
          for (let i = 0; i < dayDifference; i++) {
            let currentDate = moment(oneSwap.checkIn).add(i, 'day');
            if (currentDate.isSameOrAfter(startDate) && currentDate.isSameOrBefore(endDate)) {
              isAvailable = false;
              break;
            }
          }
        }
      }
    }
  }
  
  return isAvailable;
}
