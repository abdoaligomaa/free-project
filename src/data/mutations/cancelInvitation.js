import {
  GraphQLNonNull as NonNull,
  GraphQLInt as IntType,
  GraphQLString as StringType
} from 'graphql';

import SubguestsType from '../types/SubguestsType';
import { Subguest } from '../models';
import { sendServerEmail } from '../../core/email/sendServerEmail';

const updatePayoutStatus = {
  type: SubguestsType,

  args: {
    id: { type: new NonNull(IntType) },
    mainGuestId: { type: new NonNull(IntType) },
    mail: { type: new NonNull(StringType) }
  },

  async resolve(source, { id }, { request } , cccc) {
    let emailContent;
    let isUpdated = false;
    if (request.user) {
      const updateStatus = await Subguest.update(
        {
          invitationStatus: "Cancel",
        },
        {
          where: {
            id,
          },
        },
      ).then(function (instance) {
        if (instance > 0) {
          isUpdated = true;
        }
      });



      if (isUpdated) {
        emailContent = 'cancelld invitation by guest ' +  mail;
        
        await sendServerEmail(mainGuestId, 'InvitationCancelled', emailContent);
        return {
          status: '200',
        };
      } else {
        return {
          status: '400',
          errorMessage: 'Not Updated',
        };
      }
    } else {
      return {
        status: '500',
        errorMessage: 'Not Logged In',
      };
    }
  },
};

export default updatePayoutStatus;
