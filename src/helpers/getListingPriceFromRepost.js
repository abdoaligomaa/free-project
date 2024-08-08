import moment from 'moment';
import { Repost } from '../data/models';

export async function getListingPriceFromRepost(listing) {
  const listingList = [...listing];
  let today = new Date();
  today = moment(today).format("YYYY-MM-DD");
  const listingIds = listingList.map(ls => ls.id);
  const repost = await Repost.findAll({
    where: {
      listing_id: {
        $in: listingIds
      },
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
  if (listingList.length > 0) {
    for (let i = 0; i < listingList.length; i++) {
      const oneListing = listingList[i];
      const repostIndex = repost.findIndex(rep => rep.listing_id === oneListing.dataValues.id);
      if (repostIndex >= 0) {
        listingList[i].newNightPrice = repost[repostIndex].new_night_price;
      }
    }
  }
  return listingList;
}

export default {
  getListingPriceFromRepost,
};