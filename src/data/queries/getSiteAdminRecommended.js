import getSiteAdminRecommendedType from '../types/getSiteAdminRecommendedType';
import { getSiteAdminHomeRecommended } from '../../helpers/getSiteAdminHomeRecommended';

const getSiteAdminRecommended = {
  type: getSiteAdminRecommendedType,

  async resolve(args,source, { request } , cccc) {
    return await getSiteAdminHomeRecommended();
  },
};

export default getSiteAdminRecommended;
