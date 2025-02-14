import UserVerifiedInfoType from '../types/UserVerifiedInfoType';
import { UserVerifiedInfo } from '../../data/models';

import {
  GraphQLString as StringType,
  GraphQLNonNull as NonNull,
} from 'graphql';

const getUserVerifiedInfo = {
  type: UserVerifiedInfoType,

  args: {
    userId: { type: new NonNull(StringType) },
  },

  async resolve(source, { userId }, { request } , cccc) {
    return await UserVerifiedInfo.findOne({
      where: {
        userId,
      },
    });
  },
};

export default getUserVerifiedInfo;
