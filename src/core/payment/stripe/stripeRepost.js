import stripePackage from 'stripe';
import { payment } from '../../../config-sample';
const stripe = stripePackage(payment.stripe.secretKey);
import { getCustomerId } from './helpers/getCustomerId';
import { updateUserProfile } from './helpers/updateUserProfile';
import { Repost, Reposts_Transaction } from '../../../data/models';

const stripePaymentRepost = app => {
  app.post('/stripe-repost', async function (req, res) {
    const cardDetails = req.body.cardDetails;
    const reservationDetails = req.body.reservationDetails;
    const paymentMethodId = req.body.paymentMethodId;
    let createCustomer, customerId, intent, paymentIntentSecret;
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

    // If there is no error, the  proceed with charging
    if (status === 200) {
      // try {
      // creating the payment intents with the payment method id.
      intent = await stripe.paymentIntents.create({
        payment_method: paymentMethodId,
        amount: Math.round(reservationDetails.amount * 100),
        currency: reservationDetails.currency,
        payment_method_types: ['card'],
        confirmation_method: 'manual',
        confirm: true,
        customer: customerId,
      });

      // Server response
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
        errorMessage =
          'Sorry, something went wrong with your card. Please try again.';
      }
    }

    // if (status === 200 && charge && 'id' in charge) {
    if (status === 200 && intent && 'id' in intent) {
      paymentIntentId = intent.id;
      const repostTransaction = await Reposts_Transaction.create({
        repost_id: reservationDetails.repost_id,
        payer_email: reservationDetails.guestEmail,
        payer_id: customerId,
        transaction_id: intent.id,
        total: Math.round(reservationDetails.amount),
        currency: reservationDetails.currency,
        payment_method_id: paymentMethodId,
      });

      if (repostTransaction) {
        const updateRepost = await Repost.update(
          {
            repost_transaction_id: repostTransaction.id,
            payment_status: 'completed',
          },
          {
            where: {
              id: reservationDetails.repost_id,
            },
          },
        );
      }
    }
    let redirect = '/users/trips/itinerary/' + reservationDetails.reservationId;
    res.send({ status, errorMessage, redirect, paymentIntentSecret });
  });

  app.post('/stripe-repost-confirm', async function (req, res) {
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

    confirmIntent = await stripe.paymentIntents.confirm(confirmPaymentIntentId);

    if (status === 200 && confirmIntent && 'id' in confirmIntent) {
      const paymentMethodId = req.body.paymentMethodId;
      const repostTransaction = await Reposts_Transaction.create({
        repost_id: reservationDetails.repost_id,
        payer_email: reservationDetails.guestEmail,
        payer_id: customerId,
        transaction_id: intent.id,
        total: Math.round(reservationDetails.amount),
        currency: reservationDetails.currency,
        payment_type: 'booking',
        payment_method_id: paymentMethodId,
      });

      if (repostTransaction) {
        const updateRepost = await Repost.update(
          {
            repost_transaction_id: confirmPaymentIntentId,
            payment_status: 'completed',
          },
          {
            where: {
              id: reservationDetails.repost_id,
            },
          },
        );
      }
    }

    let redirect = '/users/trips/itinerary/' + reservationDetails.reservationId;
    res.send({ status, errorMessage, redirect });
  });

  app.get('/stripe-get-customer', async function (req, res) {
    const customer = await stripe.customers.retrieve('cus_Dn7eqHDkO4Sy3b');
    res.send({ redirect: 'blahblah' });
  });

  app.post('/stripe-create-account', async function (req, res) {
    //const customer = await stripe.customers.retrieve('cus_BWAA082C5iaGXF1');
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

export default stripePaymentRepost;
