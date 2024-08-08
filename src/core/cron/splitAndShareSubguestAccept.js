import cron from 'cron';
const CronJob = cron.CronJob;
const { RateLimit } = require('async-sema');
const AllowedLimit = RateLimit(10);
import { SiteSettings, SubguestDetail } from '../../data/models';
import { emailBroadcast } from './expiredEmail';

const splitAndShareSubguestAccept = app => {
  new CronJob(
    '0 55 23 * * *',
    async function () {
      // Run every day on 11.55 PM

      console.log('/********************************************/');
      console.log('HOLY MOLY SPLIT AND SHARE SUBGUEST UPDATE');

      // let emailLogo;
      // let getEmailLogo = await SiteSettings.findOne({
      //   where: {
      //     title: 'Email Logo',
      //   },
      //   raw: true,
      // });

      // emailLogo = getEmailLogo && getEmailLogo.value;

      const getTodaySubguestDetail = await SubguestDetail.findAll({
        attributes: ['id', 'spotStatus'],
        where: {
          status: 'paid',
          spotStatus: 'pending',
        },
      });

      // Store them in an array
      if (getTodaySubguestDetail != null && getTodaySubguestDetail.length > 0) {
        getTodaySubguestDetail.map(async item => {
          await AllowedLimit();

          // Update SubguestDetail Status
          await SubguestDetail.update(
            {
              spotStatus: 'completed',
            },
            {
              where: {
                id: item.id,
              },
            },
          );

          // await emailBroadcast(item.id, emailLogo);
        });
      }

      console.log('HOLY MOLY SPLIT AND SHARE SUBGUEST UPDATE CRON COMPLETED');
      console.log('/********************************************/');
    },
    null,
    true,
    'America/Los_Angeles',
  );
};

export default splitAndShareSubguestAccept;
