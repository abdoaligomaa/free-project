// GrpahQL
import {
  GraphQLList as List,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLNonNull as NonNull,
} from 'graphql';

import ListCalendarPriceType from '../../types/ListCalendarPriceType';
import { ListBlockedDates } from '../../models';

const getSpecialPricing = {
  type: new List(ListCalendarPriceType),

  args: {
    listId: { type: new NonNull(IntType) },
    startDate: { type: new NonNull(StringType) },
    endDate: { type: new NonNull(StringType) },
  },

  async resolve(source, { listId, startDate, endDate }, { request, response } , cccc) {

    const listingSpecialPricingData = await ListBlockedDates.findAll({
      where: {
        listId,
        blockedDates: {
          $between: [startDate, endDate],
        },
        calendarStatus: 'available',
      },
      order: [['blockedDates', 'ASC']],
      raw: true,
    });

    if (listingSpecialPricingData && listingSpecialPricingData.length > 0) {
      return listingSpecialPricingData;
    } else {
      return [];
    }
  },
};

export default getSpecialPricing;

/**
query($listId:Int!,  $startDate: String!, $endDate: String!) {
    getSpecialPricing (listId:$listId, startDate:$startDate, endDate: $endDate) {
      id
      listId
      blockedDate
      calendarStatus
      isSpecialPrice
    }
}
 */
