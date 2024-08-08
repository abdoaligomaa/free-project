import Repost from '../../../../../dist/data/models/Repost';

const getRepostsThatIntersectWithRange = async ({
  listId,
  reservationCheckInFormatted,
  reservationCheckOutFormatted,
}) => {
  const reposts = await Repost.findAll({
    where: {
      listing_id: listId,
      payment_status: 'completed',
      $or: {
        start_date: {
          $between: [reservationCheckInFormatted, reservationCheckOutFormatted],
        },
        end_date: {
          $between: [reservationCheckInFormatted, reservationCheckOutFormatted],
        },
      },
    },
    row: true,
  });
  if (reposts && reposts.length > 0) {
    return reposts;
  } else {
    return null;
  }
};
export default getRepostsThatIntersectWithRange;
