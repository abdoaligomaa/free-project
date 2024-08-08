// GrpahQL
import {
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLNonNull as NonNull,
  GraphQLFloat as FloatType,
} from 'graphql';

import RepostFixedPriceType from '../types/RepostFixedPriceType';

import { RepostFixedPrice } from '../models';

import moment from 'moment';

const createRepostFixedPrice = {
  type: RepostFixedPriceType,

  args: {
    repostId: { type: new NonNull(IntType) },
    from: { type: new NonNull(StringType) },
    to: { type: new NonNull(StringType) },
    price: { type: new NonNull(FloatType) },
  },

  async resolve(source,{ repostId, from, to, price }, { request, response }, ccc) {
    // Check if user already logged in
    if (request.user) {

      let fromFormated = moment(from).format('YYYY-MM-DD');
      let toFormated = moment(to).format('YYYY-MM-DD');

        const repostFixedPrice = await RepostFixedPrice.create({
          repostId: repostId,
          from: fromFormated,
          to: toFormated,
          price: price,
        });

        if (repostFixedPrice) {
          return repostFixedPrice;
        } else {
          return {
            status: 'failed to create a repostFixedPrice',
          };
        }
    } else {
      return {
        status: 'notLoggedIn',
      };
    }
  },
};

export default createRepostFixedPrice;
