// GrpahQL
import {
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLNonNull as NonNull,
  GraphQLFloat as FloatType,
  GraphQLBoolean as BooleanType,
  GraphQLList as listType,
  GraphQLInputObjectType as ObjectType, getNullableType
} from "graphql";

import ReservationType from '../../types/ReservationType';

import { Subguest, SubguestDetail, User } from '../../models';

// Sequelize models
import { Reservation, ReservationSpecialPricing } from '../../models';
import moment from 'moment';
import { checkAvailableListing } from '../../../helpers/checkAvailableListing';
import Coupon from '../../models/Coupon';
import UserCoupon from '../../models/UserCoupon';
import cancellCrossCoupon from "../../../helpers/cancellCrossCoupon";
import { sendEmail } from "../../../core/email/sendEmail";

const createReservation = {
  type: ReservationType,

  args: {
    listId: { type: new NonNull(IntType) },
    hostId: { type: new NonNull(StringType) },
    guestId: { type: new NonNull(StringType) },
    checkIn: { type: new NonNull(StringType) },
    checkOut: { type: new NonNull(StringType) },
    guests: { type: new NonNull(IntType) },
    message: { type: new NonNull(StringType) },
    basePrice: { type: new NonNull(FloatType) },
    cleaningPrice: { type: FloatType },
    currency: { type: new NonNull(StringType) },
    discount: { type: FloatType },
    discountType: { type: StringType },
    guestServiceFee: { type: FloatType },
    hostServiceFee: { type: FloatType },
    total: { type: new NonNull(FloatType) },
    bookingType: { type: StringType },
    paymentType: { type: IntType },
    cancellationPolicy: { type: IntType },
    specialPricing: { type: StringType },
    isSpecialPriceAssigned: { type: BooleanType },
    isSpecialPriceAverage: { type: FloatType },
    dayDifference: { type: FloatType },
    taxRate: { type: FloatType },
    checkInStart: { type: StringType },
    checkInEnd: { type: StringType },
    hostServiceFeeType: { type: StringType },
    hostServiceFeeValue: { type: FloatType },
    isPublic: { type: BooleanType },
    splitAndShare: { type: BooleanType },
    swapId: { type: IntType },
    guestEmails: { type: new NonNull(new listType(new NonNull(StringType))) },
    guestDetails: {
      type: new listType(
        new ObjectType({
          name: 'guestDetails',
          fields: {
            amount: { type: FloatType },
            email: { type: getNullableType(StringType) },
            bed: { type: getNullableType(IntType) },
            bedroomNumber: { type: getNullableType(IntType),defaultValue: 0 },
            primary: { type: BooleanType },
          },
        }),
      ),
    },
    couponId: { type: getNullableType(IntType) },
  },

  async resolve(source,{
      listId,
      hostId,
      guestId,
      checkIn,
      checkOut,
      guests,
      message,
      basePrice,
      cleaningPrice,
      currency,
      discount,
      discountType,
      guestServiceFee,
      hostServiceFee,
      total,
      bookingType,
      paymentType,
      cancellationPolicy,
      specialPricing,
      isSpecialPriceAssigned,
      isSpecialPriceAverage,
      dayDifference,
      taxRate,
      checkInStart,
      checkInEnd,
      hostServiceFeeType,
      hostServiceFeeValue,
      isPublic,
      splitAndShare,
      swapId,
      guestEmails,
      guestDetails,
      couponId,
    }, { request, response }, ccc) {
    // Check if user already logged in
    if (request.user && !request.user.admin) {
      const userId = request.user.id;
      let confirmationCode = Math.floor(100000 + Math.random() * 900000);
      let reservationState;
      let convertSpecialPricing;
      if (isSpecialPriceAssigned) {
        convertSpecialPricing = JSON.parse(specialPricing);
      }
      if (bookingType === 'instant') {
        reservationState = 'approved';
      }

      let checkInDate = moment(checkIn).format('YYYY-MM-DD');
      let checkOutDate = moment(checkOut).format('YYYY-MM-DD');

      const isAvailable = await checkAvailableListing(
        listId,
        checkInDate,
        checkOutDate,
        swapId ? 'blockedDates-swaps' : 'blockedDates-swapDates-swaps',
      );
      if (!isAvailable) {
        return {
          status: 'notAvailableDates',
        };
      }

      const reservation = await Reservation.create({
        listId,
        hostId,
        guestId,
        checkIn: checkInDate,
        checkOut: checkOutDate,
        guests,
        message,
        basePrice,
        cleaningPrice,
        currency,
        discount,
        discountType,
        guestServiceFee,
        hostServiceFee,
        total,
        confirmationCode,
        reservationState,
        paymentMethodId: paymentType,
        cancellationPolicy,
        isSpecialPriceAverage,
        dayDifference,
        // taxRate,
        checkInStart,
        checkInEnd,
        hostServiceFeeType,
        hostServiceFeeValue,
        bookingType,
        isPublic,
        splitAndShare,
        swapId,
        couponId,
      });
      if (reservation) {
        if (couponId) {
          const coupon = await Coupon.findOne({
            attributes: [
              'numOfUsage',
              'maxNumberOfUsage',
              'active',
              'isAvailable',
            ],
            where: {
              id: couponId,
            },
          });
          if (coupon) {
            const newNumberOfUsage = coupon.numOfUsage + 1;
            if (coupon.maxNumberOfUsage) {
              if (newNumberOfUsage === coupon.maxNumberOfUsage) {
                await Coupon.update({
                  numOfUsage: newNumberOfUsage,
                  active: false,
                  isAvailable: false,
                },
                {
                  where: {
                    id: couponId,
                  },
                });
              }
            } else {
              await Coupon.update(
                {
                  numOfUsage: newNumberOfUsage,
                  active: false,
                  isAvailable: false,
                },
                {
                  where: {
                    id: couponId,
                  },
                },
              );
            }
            await UserCoupon.create({
              userId,
              couponId,
            });
            if (bookingType === 'instant') {
              await cancellCrossCoupon(couponId)
            }
          }
        }
        if (convertSpecialPricing && convertSpecialPricing.length > 0) {
          convertSpecialPricing.map(async item => {
            let updateReservationSpecialPricing =
              await ReservationSpecialPricing.create({
                listId,
                reservationId: reservation.id,
                blockedDates: moment(item.blockedDates).format('YYYY-MM-DD'),
                isSpecialPrice: item.isSpecialPrice,
              });
          });
        }
        if (splitAndShare) {
          let sumPrices = guestDetails.reduce(
            (accumulator, current) => accumulator + current.amount,
            0,
          );

          const usersWithId = await User.findAll({
            where: {
              $or: guestEmails.map(email => ({ email })),
            },
            attributes: ['email', 'id'],
          });
          if (usersWithId) {
            const formattedSubGuestArray = guestEmails.map(item => {
              const user = usersWithId.find(u => u.email === item);
              return {
                email: item,
                reservationId: reservation.id,
                userId: user ? user.id : null,
              };
            });
            if (formattedSubGuestArray) {
              const CreateSubguest = await Subguest.bulkCreate(
                formattedSubGuestArray,
                { individualHooks: true },
              );
              if (CreateSubguest) {
                const formattedSubGuestDetailArray = guestDetails.map(item => {
                  const subguest = CreateSubguest.find(_subguest => {
                    return _subguest.email === item.email;
                  });

                  return {
                    subguestId: subguest ? subguest.id : null,
                    amount: item.amount,
                    bed: item.bed,
                    bedroomNumber: item.bedroomNumber,
                    reservationId: reservation.id,
                    status: item.primary ? 'paid' : 'pending',
                  };
                });
                if (formattedSubGuestDetailArray) {
                  const CreateSubguestDetail = await SubguestDetail.bulkCreate(
                    formattedSubGuestDetailArray,
                    { returning: true },
                  );
                }
              }
            }
          }
        }
        return reservation;
      } else {
        return {
          status: 'failed to create a reservation',
        };
      }
    } else {
      return {
        status: 'notLoggedIn',
      };
    }
  },
};

export default createReservation;

/**
mutation createReservation(
  $listId: Int!,
  $hostId: String!,
  $guestId: String!,
  $checkIn: String!,
  $checkOut: String!,
  $guests: Int!,
  $message: String!,
  $basePrice: Float!,
  $cleaningPrice: Float!,
  $currency: String!,
  $discount: Float,
  $discountType: String,
  $guestServiceFee: Float,
  $hostServiceFee: Float,
  $total: Float!,
  $bookingType: String
){
    createReservation(
      listId: $listId,
      hostId: $hostId,
      guestId: $guestId,
      checkIn: $checkIn,
      checkOut: $checkOut,
      guests: $guests,
      message: $message,
      basePrice: $basePrice,
      cleaningPrice: $cleaningPrice,
      currency: $currency,
      discount: $discount,
      discountType: $discountType,
      guestServiceFee: $guestServiceFee,
      hostServiceFee: $hostServiceFee,
      total: $total,
      bookingType: $bookingType
    ) {
        id
        listId,
        hostId,
        guestId,
        checkIn,
        checkOut,
        guests,
        message,
        basePrice,
        cleaningPrice,
        currency,
        discount,
        discountType,
        guestServiceFee,
        hostServiceFee,
        total,
        confirmationCode,
        createdAt
        status
    }
}
**/
