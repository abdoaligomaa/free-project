import {
  CancellationDetails,
  Reservation,
  SubguestDetail,
} from '../../../../data/models';

export async function cancelOtherReservations(checkIn, checkOut) {
  let ids = [];
  const reservations = await Reservation.findAll({
    attributes: ['id'],
    where: {
      $or: [
        {
          checkIn: {
            $between: {
              checkIn,
              checkOut,
            },
          },
        },
        {
          checkOut: {
            $between: {
              checkIn,
              checkOut,
            },
          },
        },
      ],
    },
  });

  if (reservations) {
    reservations.map(item => {
      ids.push(item.id);
    });
    
    await Reservation.update(
        {
          reservationState: 'cancelled',
        },
        {
          where: {
            id: ids,
          },
        },
      );
  }

  
}
