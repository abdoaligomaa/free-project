import FooterBlockType from '../../types/FooterBlockType';

import { FooterBlock } from '../../../data/models';

const getFooterSetting = {
  type: FooterBlockType,

  async resolve(args,source, { request } , cccc) {
    return await FooterBlock.findOne();
  },
};

export default getFooterSetting;
