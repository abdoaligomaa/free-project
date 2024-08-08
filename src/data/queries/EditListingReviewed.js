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
    ListPhotos,
  } from '../models';
  
  const editListingReviewed = {
    type: EditListingAcceptedType,
  
    args: {
      id: { type: new NonNull(IntType) },
      isReviewed: { type: new NonNull(BooleanType) },
    },
  
    async resolve(source,{
        id,
        isReviewed,
      }, { request, response }, ccc) {
      let isListUpdated = false;
      let isPhotoUpdated = false;
  
      if (request.user.admin) {
        if (isReviewed) {
          const list = await Listing.findOne({
            where: {
              id,
            },
          })
          const doUpdateListing = await Listing.update(
            {
              reviewed: isReviewed,
              title:list.additionalTitle,
              description :list.additionalDescription,
              coverPhoto: list.additionalCoverPhoto,
            },
            {
              where: {
                id,
              }
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
        }       
  
        if (isListUpdated && isPhotoUpdated) {
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
  
  export default editListingReviewed;
  