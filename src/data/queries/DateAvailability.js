import DateAvailabilityType from '../types/DateAvailabilityType';
import { ListBlockedDates, Repost, Listing } from '../../data/models';
import moment from 'moment';

import {
  GraphQLString as StringType,
  GraphQLNonNull as NonNull,
  GraphQLInt as IntType,
} from 'graphql';

const DateAvailability = {
  type: DateAvailabilityType,

  args: {
    listId: { type: new NonNull(IntType) },
    startDate: { type: new NonNull(StringType) },
    endDate: { type: new NonNull(StringType) },
    calendarType: { type: new NonNull(StringType) },
  },

  async resolve(source, { listId, startDate, endDate, calendarType }, { request, response } , cccc) {
    let convertStart = moment(startDate).format('YYYY-MM-DD 00:00:00');
    let convertEnd = moment(endDate)
      .subtract(1, 'day')
      .format('YYYY-MM-DD 23:59:59');

    const checkAvailableDates = await ListBlockedDates.findAll({
      where: {
        listId,
        blockedDates: {
          $between: [convertStart, convertEnd],
        },
      },
      raw: true
    });

    let momentStartDate = moment(startDate);
    let momentEndDate = moment(endDate);
    let dayDifference = momentEndDate.diff(momentStartDate, 'days');
    let stayedNightCount, rangeStart, rangeEnd, availableDates, dateRangeDays;
    let stayedNights = [],
      dateRange = [],
      checkAvailable = [],
      listingData = null;
    let updateDates, checkDates, calendarStatusValue, availableStatus;
    let isAvailable = false,
      dateRangeCount,
      checkAvailableDatesCount,
      isInsideSwapDates = false;
    
      if (calendarType === 'swaping') {
      listingData = await Listing.findOne({
        attributes: ['swapStartDate', 'swapEndDate'],
        where: {
          id: listId
        },
        raw: true,
      });
    }
    // Find stayed nights
    for (let i = 0; i < dayDifference; i++) {
      let currentDate = moment(startDate).add(i, 'day');
      stayedNights.push(currentDate);
      if (listingData && listingData.swapStartDate && listingData.swapEndDate) {
        const isAfterSwap = moment(currentDate).isSameOrAfter(moment(listingData.swapStartDate));
        const isBeforeSwap = moment(currentDate).isSameOrBefore(moment(listingData.swapEndDate));
        if (isAfterSwap === true && isBeforeSwap === true) {
          isInsideSwapDates = true;
        }
      }
    }

    rangeStart = new Date(startDate);
    rangeEnd = new Date(endDate);
    dateRange.push(rangeStart);
    rangeStart = new Date(+rangeStart);
    while (rangeStart < endDate) {
      dateRange.push(rangeStart);
      var newDate = rangeStart.setDate(rangeStart.getDate() + 1);
      rangeStart = new Date(newDate);
    }

    stayedNightCount = stayedNights.length;
    if (calendarType === 'reposting' || calendarType === 'swaping') {
      const reposts = await Repost.findAll({
        where: {
          listing_id: listId,
          payment_status: 'completed'
        },
        raw: true,
      });
      if (reposts.length > 0) {
        for (let i = 0; i < reposts.length; i++) {
          const oneRepost = reposts[i];
          const momentStartDate = moment(moment(oneRepost.start_date).format('YYYY-MM-DD'));
          const momentEndDate = moment(moment(oneRepost.end_date).format('YYYY-MM-DD'));
          const dayDifference = momentEndDate.diff(momentStartDate, 'days');
          if (dayDifference > 0) {
            for (let i = 0; i < dayDifference; i++) {
              let currentDate = moment(oneRepost.start_date).add(i, 'day').format('YYYY-MM-DD');
              checkAvailableDates.push({
                blockedDates: currentDate,
                calendarStatus: "blocked",
                isRepost: true
              });
            }
          }
        } 
      }
    }
    checkAvailableDatesCount = checkAvailableDates.length;    
    
    await Promise.all(
      dateRange &&
        dateRange.map(async (values, keys) => {
          dateRangeDays = moment(values).format('YYYY-MM-DD');
          checkAvailableDates &&
            checkAvailableDates.map((item, key) => {
              calendarStatusValue = moment(item.blockedDates).format(
                'YYYY-MM-DD',
              );
              const index = stayedNights.findIndex(stayedNight => moment(stayedNight).format('YYYY-MM-DD',) === calendarStatusValue);
              const availableStatus = item.calendarStatus;
              if (availableStatus == 'blocked' && index >= 0) {
                isAvailable = true;
                if (
                  calendarType === 'swaping' && 
                  item.isRepost !== null &&
                  item.isRepost === true &&
                  isInsideSwapDates === true) {
                    isAvailable = false;
                }
              }
            });
          if (isAvailable && checkAvailableDatesCount == stayedNightCount) {
            isAvailable = true;
          }
        }),
    );
    // if (checkAvailableDates.length > 0) {
    if (isAvailable == true && checkAvailableDates.length > 0) {
      return {
        status: 'NotAvailable',
      };
    } else {
      return {
        status: 'Available',
      };
    }
  },
};

export default DateAvailability;
