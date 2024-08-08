// GrpahQL
import {
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLFloat as FloatType,
  GraphQLNonNull as NonNull,
  GraphQLBoolean as BooleanType,
} from 'graphql';

import ReservationType from '../../types/ReservationType';

// Sequelize models
import { SubguestDetail } from '../../models';
import { sendNotifications } from '../../../helpers/sendNotifications';
import { sendServerEmail } from '../../../core/email/sendServerEmail';

const acceptSubguest = {
  type: ReservationType,

  args: {
    reservationId: { type: new NonNull(IntType) },
    subguestId: { type: new NonNull(IntType) },
    isMainGuest: { type: new NonNull(BooleanType) },
  },

  async resolve(source,{ reservationId, subguestId, isMainGuest }, { request, response }, ccc) {
    // Check if user already logged in
    if (request.user && isMainGuest === true) {
      await SubguestDetail.update(
        {
          spotStatus: 'completed',
        },
        {
          where: {
            subguestId: subguestId,
            reservationId: reservationId,
          },
        },
      );

      return {
        status: '204',
      };
    } else {
      return {
        status: 'notLoggedIn',
      };
    }
  },
};

export default acceptSubguest;
