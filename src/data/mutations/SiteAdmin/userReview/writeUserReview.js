// GrpahQL
import {
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLNonNull as NonNull,
  GraphQLFloat as FloatType,
} from 'graphql';

import ReviewsType from '../../../types/ReviewsType';

// Sequelize models
import { Reviews, Listing } from '../../../models';

const writeUserReview = {
  type: ReviewsType,

  args: {
    id: { type: IntType },
    listId: { type: new NonNull(IntType) },
    reviewContent: { type: new NonNull(StringType) },
    rating: { type: new NonNull(FloatType) },
  },

  async resolve(source, { id, listId, reviewContent, rating }, { request, response } , cccc) {
    if (request.user.admin) {
      let userId,
        reservationId = 0,
        parentId = 0,
        automated = 0;
      let isAdmin = 1;
      const authorId = request.user.id;
      const listDetails = await Listing.findById(listId);
      if (listDetails) {
        userId = listDetails.userId;
      } else {
        return {
          status: '404',
        };
      }
      if (id) {
        const updateReview = await Reviews.update(
          {
            listId,
            reviewContent,
            rating,
            userId,
          },
          {
            where: {
              id,
            },
          },
        );
        if (updateReview) {
          let reviewsCount = await Reviews.count({
            where: {
              listId,
              userId,
            },
          });

          let reviewsStarRating = await Reviews.sum('rating', {
            where: {
              listId,
              userId,
            },
          });

          await Listing.update(
            {
              reviewsCount: Math.round(reviewsStarRating / reviewsCount),
            },
            {
              where: { id: listId },
            },
          );

          return {
            status: '200',
          };
        } else {
          return {
            status: '400',
          };
        }
      } else {
        const createReview = await Reviews.create({
          reservationId,
          listId,
          authorId,
          userId,
          reviewContent,
          rating,
          parentId,
          automated,
          isAdmin,
        });

        if (createReview) {
          return {
            status: '200',
          };
        } else {
          return {
            status: '400',
          };
        }
      }
    } else {
      return {
        status: 'notLoggedIn',
      };
    }
  },
};

export default writeUserReview;
