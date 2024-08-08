import SiteSettingsType from '../../types/siteadmin/SiteSettingsType';
import { SiteSettings } from '../../../data/models';

const getHomeLogo = {
  type: SiteSettingsType,

  async resolve(args,source, { request } , cccc) {
    return await SiteSettings.findOne({
      where: {
        title: 'Home Page Logo',
      },
    });
  },
};

export default getHomeLogo;
