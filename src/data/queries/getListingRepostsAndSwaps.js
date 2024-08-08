// GrpahQL
import { GraphQLInt, GraphQLList, GraphQLObjectType } from 'graphql';

import {
  Listing,
  Repost,
  RepostFixedPrice,
  Reposts_Transaction,
  Swap,
} from '../models';
import AllRepostsType from '../types/AllRepostsType';
import SwapType from '../types/SwapType';

const listingRepostSwapType = new GraphQLObjectType({
  name: 'listingRepostSwapType',
  fields: {
    reposts: { type: new GraphQLList(AllRepostsType) },
    swaps: { type: new GraphQLList(SwapType) },
  },
});

const getListingRepostsAndSwaps = {
  type: listingRepostSwapType,

  args: {
    listingId: { type: GraphQLInt },
  },

  async resolve(source, { listingId }, { request }, cccc) {
    if (!request.user) return { status: 'not logged in' };

    if (!listingId) return { status: 'select listing' };

    const reposts = await getReposts(listingId);

    const swaps = await getSwaps(listingId);

    return { reposts, swaps };
  },
};

async function getReposts(listingId) {
  const reposts = await Repost.findAll({
    where: {
      listing_id: listingId,
      payment_status: 'completed',
    },
    raw: true,
  });

  return reposts.map(el => ({
    id: el.id,
    startDate: el.start_date,
    endDate: el.end_date,
  }));
}

async function getSwaps(listingId) {
  const swaps = await Swap.findAll({
    where: {
      $or: [{ hostListId: listingId }, { guestListId: listingId }],
      swapStatus: 'accepted',
    },
  });

  return swaps;
}

export default getListingRepostsAndSwaps;
