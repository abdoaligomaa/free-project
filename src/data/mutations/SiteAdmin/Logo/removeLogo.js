import SiteSettingsType from '../../../types/siteadmin/SiteSettingsType';
import { SiteSettings } from '../../../models';

const removeLogo = {
  type: SiteSettingsType,

  async resolve(args,source, { request } , cccc) {
    if (request.user && request.user.admin == true) {
      let removeLogo = await SiteSettings.destroy({
        where: {
          title: 'Logo',
        },
      });

      if (removeLogo) {
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

export default removeLogo;
