import moment from 'moment';
import { Listing } from '../data/models';

export async function geSwapListing(listing, userId) {
  const startDateNumber = -10;
  const endDateNumber = 10;
  const listingList = [...listing];
  const listingObject = {};
  const newListingList = [];
  const swapListingData = await Listing.findAll({
    attributes: ['id', 'swapStartDate', 'swapEndDate', 'swapAllowAnyDate', 'swapCountryCode'],
    where: {
      isPublished: true,
      isAccepted: true,
      userId: userId,
      $or: [
        {
          swapStartDate: {
            $ne: null
          },
          swapEndDate: {
            $ne: null
          },
        },
        {
          swapStartDate: {
            $eq: null
          },
          swapEndDate: {
            $eq: null
          },
          swapAllowAnyDate: true
        },
      ]
    },
    raw: true,
  });
  
  if (swapListingData.length === 0) {
    return listingList;
  }
  for (let i = 0; i < swapListingData.length; i++) {
    const oneSwapListing = swapListingData[i];
    if (!oneSwapListing.swapStartDate && !oneSwapListing.swapEndDate && oneSwapListing.swapAllowAnyDate === 1) {
      for (let j = 0; j < listingList.length; j++) {
        const oneListing = listingList[j].dataValues;
        if (oneSwapListing.swapCountryCode) {
          const countriesArray = oneSwapListing.swapCountryCode.split(',');

          if (
            oneListing.country !== null &&
            (oneListing.swapAllowAnyDate === true || (oneListing.swapAllowAnyDate === false && oneListing.swapStartDate && oneListing.swapEndDate)) &&
            countriesArray.includes(oneListing.country)
          ) listingObject[oneListing.id] = listingList[j];
        } else {
          if (
            oneListing.swapAllowAnyDate === true || (oneListing.swapAllowAnyDate === false && oneListing.swapStartDate && oneListing.swapEndDate)
          ) listingObject[oneListing.id] = listingList[j];
        }          
      }
    } else if (oneSwapListing.swapStartDate && oneSwapListing.swapEndDate) {
      for (let j = 0; j < listingList.length; j++) {
        const oneListing = listingList[j].dataValues;
        if (oneSwapListing.swapCountryCode && oneListing.swapStartDate && oneListing.swapEndDate) {
          if (
            oneListing.country !== null && oneListing.country === oneSwapListing.swapCountryCode
          ) {
            const swapStartDate = moment(oneSwapListing.swapStartDate).add(startDateNumber, 'days');
            const swapEndDate = moment(oneSwapListing.swapEndDate).add(endDateNumber, 'days');
            const listStartDate = moment(oneListing.swapStartDate);
            const listEndDate = moment(oneListing.swapEndDate);  
            if (
              (swapStartDate.isSameOrAfter(listStartDate) && swapStartDate.isSameOrBefore(listEndDate)) || 
              (swapEndDate.isSameOrAfter(listStartDate) && swapEndDate.isSameOrBefore(listEndDate))
            ) {
              listingObject[oneListing.id] = listingList[j];
            } 
          }
        } if (oneSwapListing.swapCountryCode && !oneListing.swapStartDate && !oneListing.swapEndDate && oneListing.swapAllowAnyDate === true) {
          if (
            oneListing.country !== null && oneListing.country === oneSwapListing.swapCountryCode
          ) {
            listingObject[oneListing.id] = listingList[j];
          }
        } else if (!oneSwapListing.swapCountryCode && oneListing.swapStartDate && oneListing.swapEndDate) {
          const swapStartDate = moment(oneSwapListing.swapStartDate).add(startDateNumber, 'days');
          const swapEndDate = moment(oneSwapListing.swapEndDate).add(endDateNumber, 'days');
          const listStartDate = moment(oneListing.swapStartDate);
          const listEndDate = moment(oneListing.swapEndDate);          
          if (
            (swapStartDate.isSameOrAfter(listStartDate) && swapStartDate.isSameOrBefore(listEndDate)) || 
            (swapEndDate.isSameOrAfter(listStartDate) && swapEndDate.isSameOrBefore(listEndDate))
          ) {
            listingObject[oneListing.id] = listingList[j];
          }          
        } else if (!oneSwapListing.swapCountryCode && !oneListing.swapStartDate && !oneListing.swapEndDate && oneListing.swapAllowAnyDate === true) {
          listingObject[oneListing.id] = listingList[j];
        }          
      }
    }
  }
  for (const listingKey in listingObject) {
    if (listingObject.hasOwnProperty(listingKey)) {
      newListingList.push(listingObject[listingKey]);
    }
  }
  return newListingList;
}

export default {
  geSwapListing,
};