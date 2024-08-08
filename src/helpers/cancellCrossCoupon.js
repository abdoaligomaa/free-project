import Coupon from '../data/models/Coupon';
import moment from 'moment';

export default async function cancellCrossCoupon(couponId) {
  let crossCoupon;

  const coupon = await Coupon.find({
    where: { id: couponId },
  });

  if (coupon) {
    crossCoupon = await Coupon.findAll({
      where: {
        listingId: coupon.listingId,
        active: true,
        isAvailable: true,
      },
    });
  }

  if (crossCoupon?.length > 0) {
    const filteredCoupons = crossCoupon.filter(item => {
      const a = moment.max(moment(item.startDate), moment(coupon.startDate));
      const b = moment.min(moment(item.endDate), moment(coupon.endDate));

      return b.isAfter(a) && item.id !== undefined;
    });

    const couponIds = filteredCoupons?.map(el => el.id);

    await Coupon.update(
      {
        active: false,
        isAvailable: false,
      },
      {
        where: {
          id: { $in: couponIds },
        },
      },
    );
  }
  return true;
}
