import PopularLocationType from '../../types/siteadmin/PopularLocationType';
import { PopularLocation } from '../../../data/models';
import { GraphQLString as StringType, GraphQLInt as IntType } from 'graphql';
const updatePopularLocation = {
  type: PopularLocationType,
  args: {
    id: { type: IntType },
    location: { type: StringType },
    locationAddress: { type: StringType },
    image: { type: StringType },
  },
  async resolve(source, { id, location, locationAddress, image }, { request } , cccc) {
    if (request.user && request.user.admin == true) {
      const Update = await PopularLocation.update(
        {
          location: location,
          locationAddress: locationAddress,
          image: image,
        },
        {
          where: {
            id: id,
          },
        },
      );
      return {
        status: 'success',
      };
    } else {
      return {
        status: 'failed',
      };
    }
  },
};
export default updatePopularLocation;
