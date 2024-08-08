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

import { Repost, Listing, RepostFixedPrice } from '../models';

import moment from 'moment';
import { checkAvailableListing } from '../../helpers/checkAvailableListing';

const createRepost = {
  type: RepostType,

  args: {
    listId: { type: new NonNull(IntType) },
    start_date: { type: new NonNull(StringType) },
    end_date: { type: new NonNull(StringType) },
    new_night_price: { type: new NonNull(FloatType) },
    isFixedPrice: { type: new NonNull(BooleanType) },
    fixedPrice: {
      type: new listType(
        new ObjectType({
          name: 'fixedPrice',
          fields: {
            from: { type: StringType },
            to: { type: StringType },
            price: { type: FloatType },
          },
        }),
      ),
    },
  },

  async resolve(source,{ listId, start_date, end_date, new_night_price, isFixedPrice, fixedPrice }, { request, response }, ccc) {
    // Check if user already logged in
    if (request.user) {
      const userId = request.user.id;

      let start_date_formated = moment(start_date).format('YYYY-MM-DD');
      let end_date_formated = moment(end_date).format('YYYY-MM-DD');

      const getListing = await Listing.findOne({
        where: {
          id: listId,
        },
        raw: true
      });

      if (getListing.isRepostAllowed) {
        const isAvailable = await checkAvailableListing(listId, start_date_formated, end_date_formated, 'blockedDates-reposts-swapDates-swaps');   
        if (!isAvailable) {
          return {
            status: 'notAvailableDates',
          };
        }
        const repost = await Repost.create({
          listing_id: listId,
          start_date: start_date_formated,
          end_date: end_date_formated,
          new_night_price: new_night_price,
          userId: userId,
          maxRepostPercentage: getListing.maxRepostPercentage,
          isFixedPrice: isFixedPrice
        });

        if (repost) {
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
            id: repost.id,
            listId: repost.list_id,
            start_date: repost.start_date,
            end_date: repost.end_date,
            new_night_price: repost.new_night_price,
            payment_status: repost.payment_status,
            userId: userId,
            status: 'success',
          };
        } else {
          return {
            status: 'failed to create a repost',
          };
        }
      } else {
        return {
          status: 'this listing is not allowed to repost',
        };
      }
    } else {
      return {
        status: 'notLoggedIn',
      };
    }
  },
};

export default createRepost;
