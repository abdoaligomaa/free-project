//import ShowListingType from '../types/ShowListingType';
import ListPhotosType from '../../types/ListPhotosType';

import { Listing, ListPhotos, Reviews } from '../../models';

import {
  GraphQLList as List,
  GraphQLInt as IntType,
  GraphQLNonNull as NonNull,
} from 'graphql';

const RemoveListing = {
  type: new List(ListPhotosType),

  args: {
    listId: { type: new NonNull(IntType) },
  },

  async resolve(source, { listId }, { request } , cccc) {
    // Check whether user is logged in
    if (request.user) {
      const getPhotos = await ListPhotos.findAll({
        where: { listId },
      });

      const removelisting = await Listing.destroy({
        where: {
          id: listId,
        },
      });

      const removereviews = await Reviews.destroy({
        where: {
          listId,
        },
      });

      if (removelisting > 0) {
        return getPhotos;
      } else {
        return {
          status: 'failed',
        };
      }
    } else {
      return {
        status: 'Not loggedIn',
      };
    }
  },
};

export default RemoveListing;
