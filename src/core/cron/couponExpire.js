import cron from 'cron';
import moment from 'moment';
import { Op } from 'sequelize';
const CronJob = cron.CronJob;
const { RateLimit } = require('async-sema');
const AllowedLimit = RateLimit(25);
import Coupon from '../../data/models/Coupon';

const couponExpire = app => {
  new CronJob(
    '0 55 23 * * *',
    async function () {
      // Run every day on 11.55 PM
      console.log('/********************************************/');
      console.log('HOLY MOLY COUPON EXPIRE CRON STARTED');

      // get all coupon id
      const today = moment(moment.now()).format('YYYY-MM-DD');
      const getCouponIds = await Coupon.findAll({
        where: {
          isAvailable: true,
        },
      });

      // Update Coupon isAvailable Status to false
      if (getCouponIds !== null && getCouponIds.length > 0) {
        getCouponIds.map(async item => {
          await AllowedLimit();
          // Get ThreadId
          const couponEndDate = moment(item.endDate).format('YYYY-MM-DD');
          if (
            couponEndDate === today ||
            item.numOfUsage === item.maxNumberOfUsage
          ) {
            await Coupon.update(
              {
                isAvailable: false,
              },
              {
                where: {
                  id: item.id,
                },
              },
            );
          }
        });
      }

      console.log('HOLY MOLY COUPON EXPIRE CRON COMPLETED');
      console.log('/********************************************/');
    },
    null,
    true,
    'America/Los_Angeles',
  );
};

export default couponExpire;
