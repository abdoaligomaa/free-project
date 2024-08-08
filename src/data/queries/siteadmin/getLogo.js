import SiteSettingsType from '../../types/siteadmin/SiteSettingsType';
import { SiteSettings } from '../../../data/models';

const getLogo = {
  type: SiteSettingsType,

  async resolve(args,source, { request } , cccc) {
    return await SiteSettings.findOne({
      where: {
        title: 'Logo',
      },
    });
  },
};

export default getLogo;
