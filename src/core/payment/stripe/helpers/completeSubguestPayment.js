import { Subguest, SubguestDetail } from '../../../../data/models';
export async function completeSubguestPayment({
  reservationId,
  subguestDetailId,
  user,
  paymentIntentId,
  isMainGuest,
}) {
  if (user) {
    const [subguest] = await Subguest.findOrCreate({
      where: {
        userId: user.id,
        reservationId: reservationId,
        email: user.email,
      },
    });

    await SubguestDetail.update(
      {
        status: 'paid',
        subguestId: subguest.dataValues.id,
        paymentIntentId,
        spotStatus: isMainGuest ? 'completed' : 'pending',
      },
      {
        where: { $or: [{ id: subguestDetailId }, { subguestId: subguest.id }] },
      },
    );
    return subguest;
  }
}
