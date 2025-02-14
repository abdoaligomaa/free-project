import PayoutType from '../../types/PayoutType';
import { Payout, PaymentMethods } from '../../models';
import stripePackage from 'stripe';
import { payment } from '../../../config-sample';

const stripe = stripePackage(payment.stripe.secretKey, {
  apiVersion: '2019-12-03',
});

import { GraphQLList as List, GraphQLString as StringType } from 'graphql';

const getPayouts = {
  type: new List(PayoutType),

  args: {
    currentAccountId: {
      type: StringType,
    },
    userId: {
      type: StringType,
    },
  },

  async resolve(source, { currentAccountId, userId }, { request }, cccc) {
    if (request.user && !request.user.admin) {
      const userId = request.user.id;
      const payEmail = currentAccountId;
      let isVerified = true,
        accountInfo = null,
        defaultValue = false,
        methodArray = [];

      if (payEmail && payEmail.toString().trim() != '') {
        const stripeAccount = await stripe.accounts.retrieve(payEmail);
        let accountUserId =
          stripeAccount &&
          stripeAccount.metadata &&
          stripeAccount.metadata.userId;
        if (userId === accountUserId) {
          if (stripeAccount) {
            accountInfo =
              stripeAccount &&
              (stripeAccount.individual || stripeAccount.company);
            if (!stripeAccount.details_submitted) {
              isVerified = false;
            }

            if (
              stripeAccount.requirements &&
              stripeAccount.requirements.disabled_reason
            ) {
              isVerified = false;
            }

            const isAccountExist = await Payout.findOne({
              attributes: ['id'],
              where: {
                payEmail,
                userId,
              },
              raw: true,
            });

            if (isAccountExist && isAccountExist.id) {
              // Update verification status to the existing Connect account
              const updatePayout = await Payout.update(
                {
                  isVerified,
                },
                {
                  where: {
                    id: isAccountExist.id,
                  },
                },
              );
            } else {
              // Create a new account
              const createPayout = await Payout.create({
                methodId: 2,
                userId,
                payEmail,
                address1:
                  accountInfo &&
                  accountInfo.address &&
                  accountInfo.address.line1,
                address2:
                  accountInfo &&
                  accountInfo.address &&
                  accountInfo.address.line2,
                city:
                  accountInfo &&
                  accountInfo.address &&
                  accountInfo.address.city,
                state:
                  accountInfo &&
                  accountInfo.address &&
                  accountInfo.address.state,
                country:
                  accountInfo &&
                  accountInfo.address &&
                  accountInfo.address.country,
                zipcode:
                  accountInfo &&
                  accountInfo.address &&
                  accountInfo.address.postal_code,
                currency:
                  stripeAccount.default_currency &&
                  stripeAccount.default_currency.toUpperCase(),
                default: false,
                last4Digits:
                  stripeAccount.external_accounts &&
                  stripeAccount.external_accounts.data &&
                  stripeAccount.external_accounts.data.length > 0 &&
                  stripeAccount.external_accounts.data[0].last4,
                isVerified,
              });
            }

            // Set Default
            const isDefaultExist = await Payout.count({
              where: {
                default: true,
                userId,
              },
            });

            if (isDefaultExist <= 0 && isVerified) {
              const updatePayoutDefault = await Payout.update(
                {
                  default: true,
                },
                {
                  where: {
                    payEmail,
                    userId,
                  },
                },
              );
            }
          }
        } else {
          return {
            status: 400,
            errorMessage: 'Oops! The User is Different',
          };
        }
      }
      const getPaymentMethods = await PaymentMethods.findAll({
        attributes: ['id'],
        where: {
          isEnable: 1,
        },
        raw: true,
      });
      getPaymentMethods.map(item => {
        methodArray.push(item.id);
      });
      return await Payout.findAll({
        where: {
          userId,
          methodId: {
            $in: methodArray,
          },
        },
      });
    } else {
      return {
        status: 'notLoggedIn',
      };
    }
  },
};

export default getPayouts;

/**

query getPayouts($currentAccountId: String) {
  getPayouts(currentAccountId: $currentAccountId) {
    id
    methodId
    paymentMethod{
      id
      name
    }
    userId
    payEmail
    address1
    address2
    city
    state
    country
    zipcode
    currency
    default
    createdAt
    status
    last4Digits
    isVerified
  }
}

**/
