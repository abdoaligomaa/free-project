import SearchSettingsType from '../types/SearchSettingsType';
import { SearchSettings } from '../../data/models';

const getSearchSettings = {
  type: SearchSettingsType,

  async resolve(args,source, { request } , cccc) {
    return await SearchSettings.findOne();
  },
};

export default getSearchSettings;
