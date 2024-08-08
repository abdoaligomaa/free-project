// GrpahQL
import {
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLNonNull as NonNull,
} from 'graphql';
import { Reservation, SiteSettings, Subguest, SubguestDetail, User, UserProfile } from '../models';

import NewSubgustType from '../types/NewSubgustType';
import { sendEmail } from '../../core/email/sendEmail';

const createNewSubgust = {
  type: NewSubgustType,

  args: {
    reservationId: { type: new NonNull(IntType) },
    subGustDetailsId: { type: new NonNull(IntType) },
    email: { type: new NonNull(StringType) },
  },

  async resolve(source,{ reservationId, subGustDetailsId, email }, { request, response }, ccc) {
    // Check if user already logged in
    if (request.user) {
      const userId = request.user.id;

      const reservation = await Reservation.findOne({
        where: {
          id: reservationId
        },
      });

      if (!reservation) {
        return {
          status: 'reservationNotFound',
        };
      }

      if (reservation.guestId !== userId) {
        return {
          status: 'notMainGust',
        };
      }

      const subguestDetail = await SubguestDetail.findOne({
        where: {
          id: subGustDetailsId
        },
        raw: true,
      });

      if (!subguestDetail) {
        return {
          status: 'subguestDetailtNotFound',
        };
      }

      const userWithId = await User.findOne({
        where: {
          email,
        },
        attributes: ['email', 'id'],
        raw: true,
      });

      const CreateSubguest = await Subguest.create(
        {
          email: email,
          reservationId: reservationId,
          userId: userWithId ? userWithId.id : null,
        },
      );

      if (!CreateSubguest && !CreateSubguest.id) {
        return {
          status: 'notCreateSubguest',
        };
      }

      const UpdateSubguestDetail = await SubguestDetail.update(
        {
          subguestId: CreateSubguest.id,
        },
        {
          where: {
            id: subGustDetailsId,
          },
        },
      );

      const guest = await User.findOne({
        where: { id: reservation.guestId },
        include: [
          {
            model: UserProfile,
            as: 'profile',
          },
        ],
      });

      const emailLogo = await SiteSettings.findOne({
        where: { title: 'Email Logo' },
        raw: true,
      });

      sendEmail(email, 'subGuestShareReservation', {
        id: reservationId,
        guest: guest.profile.firstName + ' ' + guest.profile.lastName,
        checkIn: reservation.checkIn,
        checkOut: reservation.checkOut,
        email: email,
        logo: emailLogo?.value,
      });

      return {
        status: 'success',
      };
    } else {
      return {
        status: 'notLoggedIn',
      };
    }
  },
};

export default createNewSubgust;
