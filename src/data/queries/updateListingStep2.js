// GrpahQL
import { GraphQLString as StringType, GraphQLInt as IntType } from 'graphql';

// GraphQL Type
import EditListingType from '../types/EditListingType';

// Sequelize models
import { Listing } from '../../data/models';

const updateListingStep2 = {
  type: EditListingType,

  args: {
    id: { type: IntType },
    additionalTitle: { type: StringType },
    additionalDescription: { type: StringType },
    additionalCoverPhoto: { type: IntType },
  },

  async resolve(source, { id, additionalTitle, additionalDescription, additionalCoverPhoto }, { request, response } , cccc) {
    let isListUpdated = false;
    if (request.user || request.user.admin) {
      let where = { id };
      if (!request.user.admin) {
        where = {
          id,
          userId: request.user.id,
        };
      }

      const doUpdateListing = await Listing.update(
        {
          reviewed: false,          
          additionalTitle,
          additionalDescription,
          additionalCoverPhoto,

        },
        {
          where,
        },
      ).then(function (instance) {
        // Check if any rows are affected
        if (instance > 0) {
          isListUpdated = true;
        }
      });

      if (isListUpdated) {
        return {
          status: 'success',
        };
      } else {
        return {
          status: 'failed',
        };
      }
    } else {
      return {
        status: 'notLoggedIn',
      };
    }
  },
};

export default updateListingStep2;
