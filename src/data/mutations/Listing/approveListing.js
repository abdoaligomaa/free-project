// GrpahQL
import { GraphQLInt as IntType, GraphQLString as StringType } from 'graphql';

// GraphQL Type
import EditListingType from '../../types/EditListingType';

// Sequelize models
import { Listing, ListPhotos } from '../../models';

const approveListing = {
  type: EditListingType,

  args: {
    id: { type: IntType },
    listApprovalStatus: { type: StringType },
  },

  async resolve(source, { id, listApprovalStatus }, { request, response } , cccc) {
    let isListUpdated = false;
    let isPhotoUpdated = false;

    if (request.user.admin) {
      const list = await Listing.findOne({
        where: {
          id,
        },
      })
      const doUpdateListing = await Listing.update(
        {
          listApprovalStatus,          
          title:list?.additionalTitle,
          description :list?.additionalDescription,
          coverPhoto: list?.additionalCoverPhoto,
          reviewed: true,          
        },
        {
          where: {
            id,
          },
        },
      ).spread(function (instance) {
        // Check if any rows are affected
        if (instance > 0) {
          isListUpdated = true;
        }
      });

      const doUpdatingPhoto = await ListPhotos.update(
        {
          review:true,
        },
       {
         where : {
          listId:id,
         }
       },
      ).spread(function (instance) {
        // Check if any rows are affected
        if (instance > 0) {
          isPhotoUpdated = true;
        }
      });

      if (isListUpdated && isPhotoUpdated) {
        return {
          status: '200',
        };
      } else {
        return {
          status: '400',
        };
      }
    } else {
      return {
        status: '500',
      };
    }
  },
};

export default approveListing;
