import stripePackage from 'stripe';
import { payment } from '../../../config-sample';
const stripe = stripePackage(payment.stripe.secretKey);
import { getCustomerId } from './helpers/getCustomerId';
import { updateUserProfile } from './helpers/updateUserProfile';
import { updateReservation } from './helpers/updateReservation';
import { createTransaction } from './helpers/createTransaction';
import { createThread } from './helpers/createThread';
import { blockDates } from './helpers/blockDates';
import { emailBroadcast } from './helpers/email';
import { completeSubguestPayment } from './helpers/completeSubguestPayment';
import { checkAllSubguestsPaid } from './helpers/checkAllSubguestsPaid';
import { cancelOtherReservations } from './helpers/cancelOtherReservations';
import {
  Repost_Share,
  Repost,
  Reservation,
  SubguestDetail,
} from '../../../data/models';
import moment from 'moment';
import getRepostsThatIntersectWithRange from './helpers/getRepostsThatIntersectWithRange';
import createRepostShares from './helpers/createRepostShares';

const stripePayment = app => {
  app.post('/stripe-reservation', async function (req, res) {
    const cardDetails = req.body.cardDetails;
    const reservationDetails = req.body.reservationDetails;
    const paymentMethodId = req.body.paymentMethodId;
    let createCard,
      createCustomer,
      source,
      charge,
      customerId,
      intent,
      paymentIntentSecret;
    let status = 200,
      errorMessage,
      requireAdditionalAction = false,
      paymentIntentId;
    if (reservationDetails) {
      // Check if stripe customer id is already created
      customerId = await getCustomerId(req.user.id);
    } else {
      status = 400;
      errorMessage = 'Sorry, something went wrong. Please try again.';
    }

    // If customer doesn't exist, create a customer
    if (!customerId && status === 200) {
      // try {
      createCustomer = await stripe.customers.create({
        email: reservationDetails.guestEmail,
      });
      if ('id' in createCustomer) {
        customerId = createCustomer.id;
        await updateUserProfile(req.user.id, customerId);
      }
    }

    if (status === 200) {
      try {
        intent = await stripe.paymentIntents.create({
          payment_method: paymentMethodId,
          amount: Math.round(reservationDetails.amount * 100),
          currency: reservationDetails.currency,
          payment_method_types: ['card'],
          confirmation_method: 'manual',
          confirm: true,
          customer: customerId,
        });
      } catch (e) {
        errorMessage = e.message;
      }
      if (
        intent &&
        (intent.status === 'requires_source_action' ||
          intent.status === 'requires_action') &&
        intent.next_action.type === 'use_stripe_sdk'
      ) {
        status = 400;
        requireAdditionalAction = true;
        paymentIntentSecret = intent.client_secret;
      } else if (intent && intent.status === 'succeeded') {
        status = 200;
      } else {
        status = 400;
        if (!!!errorMessage) {
          errorMessage =
            'Sorry, something went wrong with your card. Please try again.';
        }
      }
    }

    if (status === 200 && intent && 'id' in intent) {
      paymentIntentId = intent.id;
      let subguest = null;
      let isAllSubguestspaid = false;

      const reservation = await Reservation.find({
        where: {
          id: reservationDetails.reservationId,
        },
      });
      if (reservation) {
        const reservationCheckInFormatted = moment(
          reservation.dataValues.checkIn,
        ).format('YYYY-MM-DD');
        const reservationCheckOutFormatted = moment(
          reservation.dataValues.checkOut,
        ).format('YYYY-MM-DD');
        const reposts = await getRepostsThatIntersectWithRange({
          listId: reservation.dataValues.listId,
          reservationCheckInFormatted,
          reservationCheckOutFormatted,
        });
        if (reposts && reposts.length > 0) {
          await createRepostShares(reposts, reservation.dataValues);
        }

        if (!reservation.splitAndShare) {
          await updateReservation(
            reservationDetails.reservationId,
            paymentIntentId,
          );
          await createThread(reservationDetails.reservationId);
          await blockDates(reservationDetails.reservationId);
        } else {
          subguest = await completeSubguestPayment({
            reservationId: reservationDetails.reservationId,
            subguestDetailId: reservationDetails.subguestDetailId,
            user: req.user,
            paymentIntentId,
            isMainGuest: reservation.guestId === req.user.id,
          });
          isAllSubguestspaid = await checkAllSubguestsPaid(
            reservationDetails.reservationId,
          );
          if (isAllSubguestspaid) {
            await updateReservation(reservationDetails.reservationId, null);
            await createThread(reservationDetails.reservationId);
            await blockDates(reservationDetails.reservationId);
            // await cancelOtherReservations(
            //   reservationCheckInFormatted,
            //   reservationCheckOutFormatted,
            // );
          }
        }

        const guestEmail = reservationDetails.guestEmail
          ? reservationDetails.guestEmail
          : subguest.email;

        await createTransaction(
          reservationDetails.reservationId,
          guestEmail,
          customerId,
          intent.id,
          Math.round(reservationDetails.amount),
          reservationDetails.currency,
          'booking',
          2,
        );
      }
      await emailBroadcast(
        reservationDetails.reservationId,
        reservation.splitAndShare,
        req.user?.id,
        isAllSubguestspaid,
      );
    }

    let redirect = '/users/trips/itinerary/' + reservationDetails.reservationId;
    res.send({ status, errorMessage, redirect, paymentIntentSecret });
  });

  app.post('/stripe-reservation-confirm', async function (req, res) {
    const confirmPaymentIntentId = req.body.confirmPaymentIntentId;
    const reservationDetails = req.body.reservationDetails;
    let status = 200,
      errorMessage,
      customerId,
      confirmIntent;

    if (reservationDetails) {
      // Check if stripe customer id is already created
      customerId = await getCustomerId(req.user.id);
    } else {
      status = 400;
      errorMessage = 'Sorry, something went wrong. Please try again.';
    }

    // try {
    confirmIntent = await stripe.paymentIntents.confirm(confirmPaymentIntentId);
    // } catch (error) {
    //   status = 400;
    //   errorMessage = error.message;
    // }

    if (status === 200 && confirmIntent && 'id' in confirmIntent) {
      let subguest = null;
      let isAllSubguestspaid = false;

      if (!reservationDetails.splitAndShare) {
        await updateReservation(
          reservationDetails.reservationId,
          confirmPaymentIntentId,
        );
        await createThread(reservationDetails.reservationId);
        await blockDates(reservationDetails.reservationId);
      } else {
        await completeSubguestPayment({
          reservationId: reservationDetails.reservationId,
          subguestDetailId: reservationDetails.subguestDetailId,
          user: req.user,
          confirmPaymentIntentId,
        });
        isAllSubguestspaid = await checkAllSubguestsPaid(
          reservationDetails.reservationId,
        );
        if (isAllSubguestspaid) {
          await updateReservation(reservationDetails.reservationId, null);
          await createThread(reservationDetails.reservationId);
          await blockDates(reservationDetails.reservationId);
        }
      }
      const guestEmail = reservationDetails.guestEmail
        ? reservationDetails.guestEmail
        : subguest.email;
      await createTransaction(
        reservationDetails.reservationId,
        guestEmail,
        customerId,
        confirmIntent.id,
        Math.round(reservationDetails.amount),
        reservationDetails.currency,
        'booking',
        2,
      );
      await emailBroadcast(
        reservationDetails.reservationId,
        reservationDetails.splitAndShare,
        req.user?.id,
        isAllSubguestspaid,
      );
    }

    let redirect = '/users/trips/itinerary/' + reservationDetails.reservationId;
    res.send({ status, errorMessage, redirect });
  });

  app.get('/stripe-get-customer', async function (req, res) {
    const customer = await stripe.customers.retrieve('cus_Dn7eqHDkO4Sy3b');
    res.send({ redirect: 'blahblah' });
  });

  app.post('/stripe-create-account', async function (req, res) {
    var ts = Math.round(new Date().getTime() / 1000);

    const createAccount = await stripe.accounts.create({
      type: 'custom',
      country: 'US',
      email: 'tsroppseeker5@mailinator.com',
      external_account: {
        object: 'bank_account',
        country: 'US',
        currency: 'usd',
        routing_number: '110000000',
        account_number: '000123456789',
      },
      tos_acceptance: {
        date: ts,
        ip: req.connection.remoteAddress,
      },
      legal_entity: {
        dob: {
          day: '1',
          month: '10',
          year: '1988',
        },
        first_name: 'Sudharsana',
        last_name: 'Rajalingam',
        ssn_last_4: '0000',
        type: 'sole_prop',
        address: {
          city: 'madurai',
          line1: 'JaihindPuram',
          postal_code: '625011',
          state: 'Tamil Nadu',
        },
      },
    });
    res.send({ redirect: 'blahblah' });
  });

  app.post('/stripe-create-source', async function (req, res) {
    //const customer = await stripe.customers.retrieve('cus_BWAA082C5iaGXF1');
    const card = await stripe.tokens.create({
      card: {
        number: '4242424242424242',
        exp_month: 12,
        exp_year: 2018,
        cvc: '123',
      },
    });

    res.send({ redirect: 'blahblah' });
  });
};

export default stripePayment;
