// GrpahQL
import {
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLNonNull as NonNull,
  GraphQLFloat as FloatType,
  GraphQLBoolean as BooleanType,
  GraphQLList as listType,
  GraphQLInputObjectType as ObjectType,
} from 'graphql';

import RepostType from '../types/RepostType';

import { Repost, RepostFixedPrice } from '../models';

const updateRepost = {
  type: RepostType,

  args: {
    repostId: { type: new NonNull(IntType) },
    new_night_price: { type: new NonNull(FloatType) },
    isFixedPrice: { type: new NonNull(BooleanType) },
    fixedPrice: {
      type: new listType(
        new ObjectType({
          name: 'updatedFixedPrice',
          fields: {
            from: { type: StringType },
            to: { type: StringType },
            price: { type: FloatType },
          },
        }),
      ),
    },
  },

  async resolve(source,{ repostId, new_night_price, isFixedPrice, fixedPrice }, { request, response }, ccc) {
    // Check if user already logged in
    if (request.user) {
      const userId = request.user.id;

      const repost = await Repost.findOne({
        where: {
          id: repostId,
          userId: userId,
        },
        raw: true
      });

      if (repost) {
        const updatedRepost = await Repost.update({
          new_night_price: new_night_price,
          isFixedPrice: isFixedPrice
        }, {
          where: {
            id: repostId,
            userId: userId,
          }
        });

        if (updatedRepost) {
          await RepostFixedPrice.destroy({
            where: {
              repostId: repostId
            }
          });
          if (isFixedPrice === true && fixedPrice && fixedPrice.length > 0) {
            const repostFixedPrice = [];
            for (let i = 0; i < fixedPrice.length; i++) {
              const element = fixedPrice[i];
              repostFixedPrice.push({
                repostId: repost.id,
                from: element.from,
                to: element.to,
                price: element.price,
              });
            }
            await RepostFixedPrice.bulkCreate(repostFixedPrice, {
              returning: true,
            });
          }  
          return {
            id: repostId,
            new_night_price: repost.new_night_price,
            payment_status: repost.payment_status,
            status: 'success',
          };
        } else {
          return {
            status: 'failed to update a repost',
          };
        }
      } else {
        return {
          status: 'this repost is not found',
        };
      }
    } else {
      return {
        status: 'notLoggedIn',
      };
    }
  },
};

export default updateRepost;
