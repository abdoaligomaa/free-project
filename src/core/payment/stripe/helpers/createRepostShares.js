import moment from 'moment';
import { Repost_Share, RepostFixedPrice } from "../../../../data/models";
import ReservationSpecialPricing from "../../../../data/models/ReservationSpecialPricing";
import ListBlockedDates from "../../../../data/models/ListBlockedDates";

const getBasePricesOfStayedNight = (stayedNight, basePrice, specialPricing) => {
  let specialPricingValue = specialPricing.find(
    o =>
      stayedNight.format('MM/DD/YYYY') ==
      moment(o.blockedDates).format('MM/DD/YYYY'),
  );
  let currentPrice = Number(basePrice);
  if (specialPricingValue && specialPricingValue.isSpecialPrice) {
    currentPrice = Number(specialPricingValue.isSpecialPrice);
  }
  return currentPrice;
};





const getRepostInDay = ({ day, reposts }) => {
  if (reposts && reposts.length >= 0) {
    for (let i = 0; i < reposts.length; i++) {
      const repost = reposts[i].dataValues;
      let _day = moment(day).format('YYYY-MM-DD');
      let formattedDay = moment(_day);
      let repostStartDate = moment(repost.start_date);
      let repostEndDate = moment(repost.end_date);
      if (
        formattedDay.isSameOrAfter(repostStartDate) &&
        formattedDay.isBefore(repostEndDate)
      ) {
        return repost;
      }
    }
    return null;
  }
  return null;
}


const createRepostShares = async (reposts, reservation) => {
  const _reservationCheckIn = moment(reservation.checkIn).format('YYYY-MM-DD');
  const _reservationCheckOut = moment(reservation.checkOut).format(
    'YYYY-MM-DD',
  );
  const reservationCheckIn = moment(_reservationCheckIn);
  const reservationCheckOut = moment(_reservationCheckOut);
  const repostShares = [];

  const specialPricing = await ListBlockedDates.findAll({
    where: {
      listId: reservation.listId,
      isSpecialPrice: {
        $ne: null,
      },
      calendarStatus: 'available',
    },
    row: true,
  });


  // loop for each day from _reservationCheckIn to _reservationCheckOut
  for (
    let night = reservationCheckIn;
    night.isBefore(reservationCheckOut);
    night.add(1, 'day')
  ) {
    const repost = getRepostInDay({ day: night, reposts });
    // find all ListBlockedDates where listid = reservation.listId
    // and blockedDates = night and isSpecialPrice is not null and calendarStatus = 'available'


    if (repost) {
      let totalAmountInRepost = repost.new_night_price;
      if (repost.isFixedPrice) {
        let fixedPrices =await RepostFixedPrice.findAll(
          {
            where: {
              repostId: repost.id,
            }
          }
        )
        const index = fixedPrices.findIndex(
          fixedPrice =>
            night.isSameOrAfter(moment(fixedPrice.dataValues.from)) &&
            night.isSameOrBefore(moment(fixedPrice.dataValues.to)),
        );
        if (index >= 0) {
          totalAmountInRepost = repost.fixedPrice[index].price;
        }
      }
      repostShares.push({
        reservation_id: reservation.id,
        amount: totalAmountInRepost,
        host_id: repost.userId,
        start_date: night.format('YYYY-MM-DD'),
        end_date: night.format('YYYY-MM-DD'),
        repost_id: repost.id,
      });
    } else {
      const totalAmountInRepost = getBasePricesOfStayedNight(night, reservation.basePrice, specialPricing);
      repostShares.push({
        reservation_id: reservation.id,
        amount: totalAmountInRepost,
        host_id: reservation.hostId,
        start_date: night.format('YYYY-MM-DD'),
        end_date: night.format('YYYY-MM-DD'),
        repost_id: null,
      });
    }
  }
  // merge sequential repostShares
  const mergedRepostShares = [];
  let lastShare = null;
  for (let i = 0; i < repostShares.length; i++) {
    const currentShare = repostShares[i];
    if (lastShare) {
      if (
        lastShare.host_id === currentShare.host_id &&
        lastShare.amount === currentShare.amount
      ) {
        lastShare.end_date = currentShare.end_date;
      } else {
        mergedRepostShares.push(currentShare);
        lastShare = currentShare;
      }
    } else {
      mergedRepostShares.push(currentShare);
      lastShare = currentShare;
    }
  }

  if (repostShares) {
    await Repost_Share.bulkCreate(mergedRepostShares, {
      returning: true,
    });
  }
};
export default createRepostShares;
