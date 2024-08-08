// GrpahQL
import {
  GraphQLList as List,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLNonNull as NonNull,
} from 'graphql';

import ThreadsType from '../types/ThreadsType';
import { Threads } from '../../data/models';

const getThread = {
  type: ThreadsType,

  args: {
    threadType: { type: StringType },
    threadId: { type: IntType },
  },

  async resolve(source, { threadType, threadId }, { request } , cccc) {
    // Check if user already logged in
    if (request.user || request.user.admin) {
      let where = {};

      if (!request.user.admin) {
        // For Getting Specific type of threads of a logged in user(Either 'host' or 'guest')
        if (threadType === 'swap') {
          where = {
            swapId: {
              $ne: null,
            },
            $or: [
              { host: request.user.id, },
              { guest: request.user.id, },
            ],
          };
        } else if (threadType === 'host') {
          where = {
            host: request.user.id,
          };
        } else {
          where = {
            guest: request.user.id,
          };
        }
      }
      // For Getting Specific Thread
      if (threadId != undefined && threadId != null) {
        where = Object.assign({}, where, { id: threadId });
      }

      return await Threads.findOne({ where });
    } else {
      return {
        status: 'notLoggedIn',
      };
    }
  },
};

export default getThread;

/**
query getThread($threadType: String, $threadId: Int){
  getThread(threadType: $threadType, threadId: $threadId) {
    id
    listId
    guest
    listData {
      title
      city
      state
      country
      listingData {
        basePrice
        cleaningPrice
        currency
      }
    }
    threadItemForType {
      id
      threadId
      content
      sentBy
      type
      startDate
      endDate
      createdAt
    }
    guestProfile {
      profileId
      firstName
      picture
      location
    }
    hostProfile {
      profileId
      firstName
      picture
      location
    }
    status
  }
}
**/
