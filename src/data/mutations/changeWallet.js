// GrpahQL
import {
  GraphQLInt as IntType,
  GraphQLNonNull as NonNull,
  GraphQLFloat as FloatType,
  GraphQLBoolean as BooleanType,
} from 'graphql';

import WalletTransactionType from '../types/WalletTransactionType';

import { Wallet, WalletTransaction } from '../models';

const changeeWallet = {
  type: WalletTransactionType,

  args: {
    isWithdrawal: { type: new NonNull(BooleanType) },
    reservationId: { type: new NonNull(IntType) },
    amount: { type: new NonNull(FloatType) },
  },

  async resolve(source,{ isWithdrawal, reservationId, amount }, { request, response }, ccc) {
    // Check if user already logged in
    if (request.user) {
      const userId = request.user.id;

      let getWallet = await Wallet.findOne({
        where: {
          userId: userId,
        },
        raw: true,
      });

      if (!getWallet) {
        getWallet = await Wallet.create({
          userId: userId,
          balance: 0,
        });
      }
      let balance = 0;
      if (isWithdrawal) {
        balance = getWallet.balance - amount;
      } else {
        balance = getWallet.balance + amount;
      }

      const trans = await WalletTransaction.create({
        isWithdrawal: isWithdrawal,
        reservationId: reservationId,
        balance: balance,
        amount: amount,
        walletId: getWallet,
      });

      const wallet = await Wallet.update(
        {
          balance: balance,
        },
        {
          where: {
            walletId: getWallet,
          },
        },
      );

     
          return {
            trans
          };
        } else {
          return {
            status: 'notLoggedIn',
          };
        }
      } 
};

export default changeeWallet;
