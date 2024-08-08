// GrpahQL
import {
  GraphQLInt as IntType,
  GraphQLNonNull as NonNull,
} from 'graphql';

import SubguestType from '../types/SubguestType';

// Sequelize models
import {
Subguest,
SubguestDetail
} from '../models';

const cancelSubguestReservation = {
  type: SubguestType,

  args: {
    reservationId: { type: new NonNull(IntType) }
  },

  async resolve(source,{ reservationId }, { request }, ccc) {
    if (request.user) {
      const userId = request.user.id;
      const subguest = await Subguest.findOne(
        {
          attributes: ['id'],
          where: {
            reservationId: reservationId,
            userId: userId
          },
        },
      );
      if(subguest)
      {
        await SubguestDetail.destroy({
          where:{
            subguestId: subguest.id
          }
        })
        await Subguest.update(
          { userId: null,
            email: null },
          {
          where:{
            id: subguest.id
          }
        })
      }
    } else {
      return {
        status: 'notLoggedIn',
      };
    }
  },
};

export default cancelSubguestReservation;