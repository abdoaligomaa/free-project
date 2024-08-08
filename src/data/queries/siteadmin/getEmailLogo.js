import SiteSettingsType from '../../types/siteadmin/SiteSettingsType';
import { SiteSettings } from '../../../data/models';

const getEmailLogo = {
  type: SiteSettingsType,

  async resolve(args,source, { request } , cccc) {
    return await SiteSettings.findOne({
      where: {
        title: 'Email Logo',
      },
    });
  },
};

export default getEmailLogo;
