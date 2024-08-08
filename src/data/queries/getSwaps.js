// GrpahQL
import {
  GraphQLList,
  GraphQLString as StringType,
} from 'graphql';

import SwapType from '../types/SwapType';
import { Listing, Swap, Threads } from '../models';

const getSwaps = {
  type: new GraphQLList(SwapType),

  args: {
    as: { type: StringType },
  },

  async resolve(source, { as }, { request } , cccc ) {
    if (request.user) {
      const id = request.user.id;

      const or = []

      if (as != 'host') or.push({guestId: id})
      if (as != 'guest') or.push({hostId: id})

      const swaps = await Swap.findAll({
        where: {
          $or: or,
        },
        include: [
          {
            model: Listing,
            as: 'hostList',
          },
          {
            model: Listing,
            as: 'guestList',
          },
        ],
        order: [['createdAt', 'DESC']],
      });

      if (swaps.length) {
        for (let i = 0; i < swaps.length; i++) {
          const thread = await Threads.findOne({
            where: {
              swapId: swaps[i].id
            },
          });

          if (thread) {
            swaps[i].threadId = thread.id;
          }
        }
      }
      return swaps;
    } else {
      return {
        status: 'not loggin',
      };
    }
  },
};

export default getSwaps;
