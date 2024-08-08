import SiteSettingsType from '../../../types/siteadmin/SiteSettingsType';
import { SiteSettings } from '../../../models';

const removeHomeLogo = {
  type: SiteSettingsType,

  async resolve(args,source, { request } , cccc) {
    if (request.user && request.user.admin == true) {
      let removeHomeLogo = await SiteSettings.destroy({
        where: {
          title: 'Home Page Logo',
        },
      });

      if (removeHomeLogo) {
        return {
          status: 'success',
        };
      } else {
        return {
          status: 'failed',
        };
      }
    } else {
      return {
        status: 'not logged in',
      };
    }
  },
};

export default removeHomeLogo;
