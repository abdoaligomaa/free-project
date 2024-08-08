import {
  Reservation,
  Threads,
  ThreadItems,
  UserProfile,
  Swap,
} from '../../../../data/models';
import { sendNotifications } from '../../../../helpers/sendNotifications';

export async function createThread(reservationId) {
  // Find Reservation and collect data
  const reservation = await Reservation.findOne({
    where: {
      id: reservationId,
    },
  });

  if (reservation) {
    let swapId = null,
      swapGuestListId = null,
      swapHostListId = null;
    if (reservation.swapId) {
      const swap = await Swap.findOne({
        attributes: [
          'id',
          'hostListId',
          'guestListId'
        ],
        where: {
          id: reservation.swapId,
        },
        raw: true,
      });
      if (swap) {
        swapId = swap.id;
        swapGuestListId = swap.guestListId;
        swapHostListId = swap.hostListId;
      }
    }
    //Find or create a thread
    let thread = null;
    let threadId = null;
    if(swapId) {
      // thread = await Threads.create({
      //   listId: reservation.listId,
      //   host: reservation.hostId,
      //   guest: reservation.guestId,
      //   messageUpdatedDate: new Date(),
      //   isRead: false,
      //   swapId: swapId,
      //   swapGuestListId: swapGuestListId,
      //   swapHostListId: swapHostListId,
      // });
      // threadId = thread.id;
    } else {
      thread = await Threads.findOrCreate({
        where: {
          listId: reservation.listId,
          host: reservation.hostId,
          guest: reservation.guestId,
        },
        defaults: {
          //properties you want on create
          listId: reservation.listId,
          host: reservation.hostId,
          guest: reservation.guestId,
          messageUpdatedDate: new Date(),
          isRead: false,
        },
      });
      threadId = thread[0].dataValues.id;
    }    

    if (thread) {
      let bookType;
      if (reservation.reservationState === 'pending') {
        bookType = 'requestToBook';
      } else {
        bookType = 'intantBooking';
      }
      let threadItems = null;
      if(swapId) {
        // threadItems = await ThreadItems.create({
        //   threadId: threadId,
        //   reservationId: reservation.id,
        //   sentBy: reservation.guestId,
        //   content: reservation.message,
        //   type: 'message',
        //   startDate: reservation.checkIn,
        //   endDate: reservation.checkOut,
        //   personCapacity: reservation.guests,
        // });
      } else {
        threadItems = await ThreadItems.findOrCreate({
          where: {
            threadId: threadId,
            reservationId: reservation.id,
            sentBy: reservation.guestId,
            startDate: reservation.checkIn,
            endDate: reservation.checkOut,
            type: bookType,
          },
          defaults: {
            //properties you want on create
            threadId: threadId,
            reservationId: thread[0].dataValues.swapId ? null : reservation.id,
            sentBy: reservation.guestId,
            content: reservation.message,
            type: bookType,
            startDate: reservation.checkIn,
            endDate: reservation.checkOut,
            personCapacity: reservation.guests,
          },
        });
      }

      let notifyUserId, notifyUserType, notifyContent, userName;
      notifyUserId = reservation.hostId;
      notifyUserType = 'host';

      const hostProfile = await UserProfile.findOne({
        where: {
          userId: reservation.guestId,
        },
      });

      const guestProfile = await UserProfile.findOne({
        where: {
          userId: reservation.guestId,
        },
      });

      userName =
        guestProfile && guestProfile.displayName
          ? guestProfile.displayName
          : guestProfile.firstName;

      notifyContent = {
        screenType: 'trips',
        userType: notifyUserType.toString(),
        userName: userName,
        content: reservation.message,
      };

      sendNotifications('newBooking', notifyContent, notifyUserId);
      const updateThreads = await Threads.update(
        {
          isRead: false,
        },
        {
          where: {
            id: threadId,
          },
        },
      );
    }
  }
}
