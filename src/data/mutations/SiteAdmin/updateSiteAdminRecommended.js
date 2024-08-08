import getSiteAdminRecommendedType from '../../types/getSiteAdminRecommendedType';
import { SiteSettings } from '../../models';
import { GraphQLBoolean as BooleanType } from 'graphql';
const updateSiteAdminRecommended = {
  type: getSiteAdminRecommendedType,
  args: {
    repostAllowed: { type: BooleanType },
    swapAllowed: { type: BooleanType },
  },
  async resolve(source, { repostAllowed, swapAllowed }, { request } , cccc) {
    if (request.user && request.user.admin == true) {
      const type = 'homeRecommended_settings';
      if (repostAllowed !== undefined) {
        const title = 'Recommended Repost';
        const name = 'recommendedRepost';
        const value = repostAllowed === true ? '1' : '0';
        const where = { 
          type,
          name
        };
        const getData = await SiteSettings.findOne({
          attributes: ['id'],
          where,
          raw: true,
        });
  
        if (getData && getData.id) {
          await SiteSettings.update({ value }, { where: { id: getData.id } });
        } else {
          await SiteSettings.create({
            title,
            name,
            value,
            type,
          });
        }
      }

      if (swapAllowed !== undefined) {
        const title = 'Recommended Swap';
        const name = 'recommendedSwap';
        const value = swapAllowed === true ? '1' : '0';
        const where = { 
          type,
          name
        };
        const getData = await SiteSettings.findOne({
          attributes: ['id'],
          where,
          raw: true,
        });
  
        if (getData && getData.id) {
          await SiteSettings.update({ value }, { where: { id: getData.id } });
        } else {
          await SiteSettings.create({
            title,
            name,
            value,
            type,
          });
        }
      }
      return { status: 'Success' };
    } else {
      return {
        status: 'failed',
      };
    }
  },
};
export default updateSiteAdminRecommended;
