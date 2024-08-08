import BannerType from '../types/BannerType';
import { Banner } from '../../data/models';

const getBanner = {
  type: BannerType,

  async resolve(args,source, { request } , cccc) {
    return await Banner.findOne();
  },
};

export default getBanner;
