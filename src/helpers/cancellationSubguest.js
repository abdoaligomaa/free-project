import { Reservation, Subguest, SubguestDetail } from '../data/models';

export async function cancellationSubguest(subguestDetailId) {

  const subguestDetails = await SubguestDetail.findOne({
    where: {
      id: subguestDetailId,
    },
  });

  const reservation = await Reservation.findOne({
    where: {
      id: subguestDetails.reservationId,
    },
  });

  const reservationDetails = {
    transactionId: subguestDetails.paymentIntentId,
    amount: subguestDetails.amount,
    currency: reservation.currency,
    reservationId: subguestDetails.reservationId,
  };

  const URL = '/stripe-refund';
  let variables = {
    reservationDetails,
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

  if (status === 200 && redirect) {
    if(!reservation.isPublic)
    {
      const updateSubguestDetail = await SubguestDetail.update({
        status: "pending",
        subguestId: null
      },
      {
        where:{
          id: subguestDetailId
        }
      })
    }else{
      const deleteSubguestDetail = await SubguestDetail.destroy({
        where:{
          id: subguestDetailId
        }
      })
      if(deleteSubguestDetail){
        const updateSubguest = await Subguest.update({
          email: null,
          userId: null
        },
        {
          where:{
            id: subguestDetails.subguestId,
          }
        })
      }
    }
    window.location = redirect;
  }

  return {
    status: "success"
  };
}
