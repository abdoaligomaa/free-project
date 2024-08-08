import moment from 'moment';
import { Repost } from '../data/models';

export async function getListingDataPriceFromRepost(listingData) {
  let today = new Date();
  today = moment(today).format("YYYY-MM-DD");
  const listingDataId = listingData.dataValues.id;
  const repost = await Repost.findAll({
    where: {
      listing_id: listingDataId,
      start_date: {
        $lte: today,
      },
      end_date: {
        $gte: today,
      },
      payment_status: 'completed'
    },
    raw: true,
  });

  const repostIndex = repost.findIndex(rep => rep.listing_id === listingDataId);
  if (repostIndex >= 0) {
    listingData.newNightPrice = repost[repostIndex].new_night_price;
  }

  const reposts = await Repost.findAll({
    where: {
      listing_id: listingDataId,
      end_date: {
        $gte: today,
      },
      payment_status: 'completed'
    },
    raw: true,
  });

  const allReposts = [];
  if (reposts.length > 0) {
    for (let i = 0; i < reposts.length; i++) {
      const oneRepost = reposts[i];
      allReposts.push({
        id: oneRepost.id,
        userId: oneRepost.userId,
        startDate: oneRepost.start_date,
        endDate: oneRepost.end_date,
        newNightPrice: oneRepost.new_night_price,
      });
    }
  }
  listingData.reposts = allReposts;
  return listingData;
}

export default {
  getListingDataPriceFromRepost,
};