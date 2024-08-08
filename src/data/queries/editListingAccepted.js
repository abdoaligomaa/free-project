// GrpahQL
import {
  GraphQLInt as IntType,
  GraphQLBoolean as BooleanType,
  GraphQLNonNull as NonNull,
} from 'graphql';

// GraphQL Type
import EditListingAcceptedType from '../types/EditListingAcceptedType';

// Sequelize models
import {
  Listing,
} from '../models';

const editListingAccepted = {
  type: EditListingAcceptedType,

  args: {
    id: { type: new NonNull(IntType) },
    isAccepted: { type: new NonNull(BooleanType) },
  },

  async resolve(source,{
      id,
      isAccepted,
    }, { request, response }, ccc) {
    let isListUpdated = false;

    if (request.user && request.user.admin) {
      const where = { id };

      const values = {
        isAccepted: isAccepted,
      };

      const doUpdateListing = await Listing.update(
        values,
        {
          where,
        },
      ).spread(function (instance) {
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

export default editListingAccepted;
