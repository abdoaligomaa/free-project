// GrpahQL
import { GraphQLString as StringType, GraphQLInt as IntType } from 'graphql';

import AllThreadsType from '../types/AllThreadsType';
import { Threads } from '../../data/models';

const GetAllThreads = {
  type: AllThreadsType,

  args: {
    threadType: { type: StringType },
    threadId: { type: IntType },
    currentPage: { type: IntType },
  },

  async resolve(source, { threadType, threadId, currentPage }, { request } , cccc) {
    const limit = 5;
    let offset = 0;
    // Offset from Current Page
    if (currentPage) {
      offset = (currentPage - 1) * limit;
    }
    // Check if user already logged in
    if (request.user && !request.user.admin) {
      let where = {};

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
          swapId: {
            $eq: null,
          },
        };
      } else {
        where = {
          guest: request.user.id,
          swapId: {
            $eq: null,
          },
        };
      }

      // For Getting Specific Thread
      if (threadId != undefined && threadId != null) {
        where = Object.assign({}, where, { id: threadId });
      }
      const count = await Threads.count({ where });
      const threadsData = await Threads.findAll({
        where,
        //order: [[`isRead`, `ASC`]],
        order: [
          [`isRead`, `ASC`],
          ['updatedAt', 'DESC'],
        ],
        limit,
        offset,
      });
      return {
        threadsData,
        count,
      };
    } else {
      return {
        status: 'notLoggedIn',
      };
    }
  },
};

export default GetAllThreads;

/**
query GetAllThreads($threadType: String, $threadId: Int){
  GetAllThreads(threadType: $threadType, threadId: $threadId) {
    id
    listId
    host
    guest
    threadItem {
      id
      threadId
      sentBy
      type
      createdAt
    }
    threadItems {
      id
      threadId
      sentBy
      type
      createdAt
    }
    hostProfile {
      profileId
      firstName
      picture
    }
    guestProfile {
      profileId
      firstName
      picture
    }
    status
  }
}
**/
