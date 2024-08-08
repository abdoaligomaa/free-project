import ShowListingType from '../types/ShowListingType';
import { Listing } from '../../data/models';
import { GraphQLList as List } from 'graphql';
import sequelize from '../sequelize';

const getHasSharingNow = {
  type: new List(ShowListingType),

  async resolve(_parent, _args, { request }, _info) {
    const where = {
      isPublished: true,
      isAccepted: true,
      id: {
        $in: [
          sequelize.literal(
            'SELECT Reservation.listId FROM Reservation ' +
              'INNER JOIN SubguestDetail ON Reservation.id = SubguestDetail.reservationId ' +
              'WHERE Reservation.isPublic = 1 AND ' +
              "Reservation.reservationState IN ('pending', 'approved') AND " +
              "SubguestDetail.status LIKE 'pending' AND " +
              'SubguestDetail.subguestId IS NULL',
          ),
        ],
      },
    };

    if (request.user?.id && !request.user.admin) {
      where.userId = {
        $ne: request.user.id,
      };
    }

    const listing = await Listing.findAll({ where });

    return listing;
  },
};

export default getHasSharingNow;
