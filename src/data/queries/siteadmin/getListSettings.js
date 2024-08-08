import { ListSettingsSingle } from '../../types/siteadmin/AdminListSettingsType';
import { ListSettings } from '../../../data/models';

import { GraphQLInt as IntType } from 'graphql';

const getListSettings = {
  type: ListSettingsSingle,

  args: {
    typeId: { type: IntType },
  },

  async resolve(source, { typeId }, { request } , cccc) {
    if (request.user) {
      const listSettings = await ListSettings.findAll({
        where: {
          typeId,
        },
        raw: true,
      });

      return {
        listData: listSettings,
      };
    } else {
      return {
        status: 400,
      };
    }
  },
};

export default getListSettings;
