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
import { Subguest, SubguestDetail } from '../../models';
import { sendNotifications } from '../../../helpers/sendNotifications';
import { sendServerEmail } from '../../../core/email/sendServerEmail';

const cancelSubguest = {
  type: ReservationType,

  args: {
    reservationId: { type: new NonNull(IntType) },
    subguestId: { type: new NonNull(IntType) },
    isMainGuest: { type: new NonNull(BooleanType) },
  },

  async resolve(source,{ reservationId, subguestId, isMainGuest }, { request, response }, ccc) {
    // TODO : handle the refund when the subguest already paid
    // Check if user already logged in
    if (request.user && isMainGuest === true) {
      await SubguestDetail.update(
        {
          subguestId: null,
          status: 'pending',
          spotStatus: 'pending',
        },
        {
          where: {
            subguestId: subguestId,
            reservationId: reservationId,
          },
        },
      );

      await Subguest.destroy({
        where: {
          id: subguestId,
        },
      });

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

export default cancelSubguest;
