import {
  GraphQLObjectType as ObjectType,
  GraphQLID as ID,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLBoolean as BooleanType,
  GraphQLList as List,
} from 'graphql';
// Models
import { UserProfile, ThreadItems, Listing, User, Swap } from '../models';
// Types
import ThreadItemsType from './ThreadItemsType';
import ProfileType from './ProfileType';
import ShowListingType from './ShowListingType';
import UserType from './UserType';
import SwapType from './SwapType';
const ThreadsType = new ObjectType({
  name: 'Threads',
  fields: {
    id: {
      type: IntType,
    },
    listId: {
      type: IntType,
    },
    swapId: {
      type: IntType,
    },
    swapHostListId: {
      type: IntType,
    },
    swapGuestListId: {
      type: IntType,
    },
    userBanStatus: {
      type: IntType,
    },
    host: {
      type: StringType,
    },
    guest: {
      type: StringType,
    },
    createdAt: {
      type: StringType,
    },
    status: {
      type: StringType,
    },
    listData: {
      type: ShowListingType,
      resolve(threads, {}, request) {
        let listId = 0;
        if (!threads.swapId && threads.listId) {
          listId = threads.listId;
        } else if (threads.swapId && request.request.user.id === threads.host) {
          listId = threads.swapGuestListId;
        } else if (
          threads.swapId &&
          request.request.user.id === threads.guest
        ) {
          listId = threads.swapHostListId;
        }
        return Listing.findOne({ where: { id: listId } });
      },
    },
    swapData: {
      type: SwapType,
      resolve(threads) {
        if (threads.swapId) {
          return Swap.findOne({ where: { id: threads.swapId } });
        } else {
          return null;
        }
      },
    },
    swapHostListData: {
      type: ShowListingType,
      resolve(threads) {
        let listId = 0;
        if (threads.swapId && threads.swapHostListId) {
          listId = threads.swapHostListId;
        }
        return Listing.findOne({ where: { id: listId } });
      },
    },
    swapGuestListData: {
      type: ShowListingType,
      resolve(threads) {
        let listId = 0;
        if (threads.swapId && threads.swapGuestListId) {
          listId = threads.swapGuestListId;
        }
        return Listing.findOne({ where: { id: listId } });
      },
    },
    hostProfile: {
      type: ProfileType,
      resolve(threads) {
        return UserProfile.findOne({ where: { userId: threads.host } });
      },
    },
    hostUserData: {
      type: UserType,
      resolve(threads) {
        return User.findOne({ where: { id: threads.host } });
      },
    },
    guestProfile: {
      type: ProfileType,
      resolve(threads) {
        return UserProfile.findOne({ where: { userId: threads.guest } });
      },
    },
    guestUserData: {
      type: UserType,
      resolve(threads) {
        return User.findOne({ where: { id: threads.guest } });
      },
    },
    threadItems: {
      type: new List(ThreadItemsType),
      resolve(threads) {
        return ThreadItems.findAll({
          where: {
            threadId: threads.id,
          },
          order: [['createdAt', 'DESC']],
          limit: 5,
          offset: 0,
        });
      },
    },
    threadItemsCount: {
      type: IntType,
      resolve(threads) {
        return ThreadItems.count({
          where: {
            threadId: threads.id,
          },
          order: [['createdAt', 'DESC']],
        });
      },
    },
    threadItem: {
      type: ThreadItemsType,
      resolve(threads) {
        return ThreadItems.findOne({
          where: {
            threadId: threads.id,
          },
          limit: 1,
          order: [['createdAt', 'DESC']],
        });
      },
    },
    threadItemForType: {
      type: ThreadItemsType,
      resolve(threads) {
        const where = {
          threadId: threads.id,
        };
        if (!threads.swapId && threads.listId) {
          where.type = {
            $notIn: ['message'],
          };
        } else if (threads.swapId) {
          where.type = {
            $in: ['message'],
          };
        }
        return ThreadItems.findOne({
          where,
          limit: 1,
          order: [['createdAt', 'DESC']],
        });
      },
    },
    threadItemUnread: {
      type: ThreadItemsType,
      resolve(threads, {}, request) {
        return ThreadItems.findOne({
          where: {
            threadId: threads.id,
            sentBy: {
              $ne: request.user.id,
            },
            isRead: false,
          },
          limit: 1,
          order: [['createdAt', 'DESC']],
        });
      },
    },
    hostUnreadCount: {
      type: IntType,
      resolve(threads, {}, request) {
        return ThreadItems.count({
          where: {
            threadId: threads.id,
            sentBy: {
              $ne: request.user.id,
            },
            isRead: false,
          },
        });
      },
    },
    isRead: {
      type: BooleanType,
    },
  },
});
export default ThreadsType;
