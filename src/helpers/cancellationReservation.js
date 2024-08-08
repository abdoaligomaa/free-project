
import { Reservation, SubguestDetail } from '../data/models';

export default async function cancellationReservation(reservationId, state) {
  const updatedReservation = await Reservation.update(
    {
      reservationState: state,
    },
    {
      where: {
        id: reservationId,
      },
    },
  );

  const reservation = await Reservation.findOne({
    where: {
      id: reservationId,
    },
  });

  const subguestDetails = await SubguestDetail.findAll({
    where: {
      reservationId,
      status: 'paid',
    },
  });

  const allReservationDetails = subguestDetails.map(item => {
    return {
      transactionId: item.paymentIntentId,
      amount: item.amount,
      currency: reservation.currency,
      reservationId: item.id,
    };
  });
let responce = [];
  for (item of allReservationDetails) {
    const URL = '/stripe-refund';
    let variables = {
      reservationDetails: item,
    };
    const resp = await fetch(URL, {
      method: 'post',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(variables),
      credentials: 'include',
    });

    const {
      status,
      errorMessage,
      redirect,
      accountId,
      paymentIntentSecret,
    } = await resp.json();
    
      responce.push({status,
        errorMessage,
        redirect,
        accountId,
        paymentIntentSecret,})
    
  }

  if(responce.every(e => e.status === 200))
  {
    return {
      status: "success"
    }
  }else{
    return {
      status: "something wrong"
    }
  }

}
