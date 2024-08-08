import ImageBannerType from '../types/ImageBannerType';
import { ImageBanner } from '../models';

const getImageBanner = {
  type: ImageBannerType,

  async resolve(args,source, { request } , cccc) {
    return await ImageBanner.findOne();
  },
};

export default getImageBanner;
