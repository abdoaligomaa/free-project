import {
  GraphQLNonNull as NonNull,
  GraphQLInt as IntType,
  GraphQLString as StringType,
} from 'graphql';

import ReservationType from '../types/ReservationType';
import { Subguest } from '../models';
import cancellationReservation from '../../helpers/cancellationReservation';

const cancelReservtionMutation = {
  type: ReservationType,

  args: {
    id: { type: new NonNull(IntType) },
  },

  async resolve(source, { id }, { request } , cccc) {
    if (request.user) {
      const confirmSubguest = await Subguest.findOne({
        where: {
          reservationId: id,
          email: request.user.email,
        },
      });

      if (confirmSubguest) {
        const status = await cancellationReservation(id, "canceled");
        if (status) {
          return {
            status,
          };
        }
      } else {
        return {
          status: '403',
          errorMessage: 'Not Authorized to cancel',
        };
      }
    } else {
      return {
        status: '401',
        errorMessage: 'Not Logged In',
      };
    }
  },
};

export default cancelReservtionMutation;
