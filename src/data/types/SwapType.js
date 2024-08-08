import {
  GraphQLObjectType as ObjectType,
  GraphQLID as ID,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLBoolean as BooleanType,
} from 'graphql';
import ShowListingType from './ShowListingType';

const SwapType = new ObjectType({
  name: 'SwapType',
  fields: {
    id: {
      type: IntType,
    },
    hostId: {
      type: StringType,
    },
    hostListId: {
      type: IntType,
    },
    threadId: {
      type: IntType,
    },
    guestListId: {
      type: IntType,
    },
    guestId: {
      type: StringType,
    },
    checkIn: {
      type: StringType,
    },
    checkOut: {
      type: StringType,
    },
    swapStatus: {
      type: StringType,
    },
    hostList: {
      type: ShowListingType,
    },
    guestList: {
      type: ShowListingType,
    },
    swapCountry: { 
      type: StringType 
    },
    swapDatesSelected: { 
      type: IntType 
    },
    swapStayedNights: { 
      type: IntType 
    },
    swapIsSpecialPriceAssigned: { 
      type: BooleanType 
    },
    swapIsAverage: { 
      type: StringType 
    },
    swapCurrency: { 
      type: StringType 
    },
    swapDayDifference: { 
      type: IntType 
    },
    swapIsDayTotal: { 
      type: StringType 
    },
    swapDiscount: { 
      type: StringType 
    },
    swapDiscountType: { 
      type: StringType 
    },
    swapCleaningPrice: { 
      type: StringType 
    },
    swapServiceFee: { 
      type: StringType 
    },
    swapTotal: { 
      type: StringType 
    },
    couponAmount: { 
      type: StringType 
    },
    couponCurrency: { 
      type: StringType 
    },
    couponType: { 
      type: StringType 
    },
    status: {
      type: StringType,
    },
    updatedAt: {
      type: StringType,
    },
    createdAt: {
      type: StringType,
    },
  },
});

export default SwapType;
