var CronJob = require('cron').CronJob;
import sequelize from '../../data/sequelize';
import { Reservation } from '../../data/models';
import cancellationReservation  from '../../helpers/cancellationReservation';

const splitAndShareReservationExpire = app => {
  new CronJob(
    '0 55 23 * * *',
    async function() {
      // Run every day on 11.55 PM

      console.log('/********************************************/');
      console.log('HOLY MOLY SPLIT AND SHARE RESERVATION EXPIRE CRON STARTED');

      const getReservationIdsFrom2Days = await Reservation.findAll({
        attributes: [
          'id',
          'reservationState',
          'splitAndShare',
          [
            sequelize.literal('TIMESTAMPDIFF(HOUR, createdAt, NOW())'),
            'hours_difference',
          ],
        ],
        having: {
          hours_difference: {
            $gt: 48,
          },
          reservationState: 'pending',
          splitAndShare: true,
        },
      });
      if (getReservationIdsFrom2Days) {
        for (let item in getReservationIdsFrom2Days) {
          await cancellationReservation(item.id, "expired");
        }
      }

      console.log(
        'HOLY MOLY SPLIT AND SHARE RESERVATION EXPIRE CRON COMPLETED',
      );
      console.log('/********************************************/');
    },
    null,
    true,
    'America/Los_Angeles',
  );
};

export default splitAndShareReservationExpire;
