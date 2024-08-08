import UnreadCountType from '../types/UnreadCountType';
import { Threads, ThreadItems } from '../../data/models';
const getUnreadCount = {
  type: UnreadCountType,
  async resolve(args,source, { request } , cccc) {
    // Check if user already logged in
    if (request.user && !request.user.admin) {
      // For Host
      const hostCount = await Threads.count({
        where: {
          host: request.user.id,
          isRead: false,
          swapId: {
            $eq: null,
          },
        },
        include: [
          {
            model: ThreadItems,
            as: 'threadItems',
            require: true,
            where: {
              sentBy: {
                $ne: request.user.id,
              },
              isRead: false,
            },
            order: [['isRead', 'DSC']],
          },
        ],
      });
      // For Travelling
      const guestCount = await Threads.count({
        where: {
          guest: request.user.id,
          isRead: false,
          swapId: {
            $eq: null,
          },
        },
        include: [
          {
            model: ThreadItems,
            as: 'threadItems',
            require: true,
            where: {
              sentBy: {
                $ne: request.user.id,
              },
              isRead: false,
            },
            order: [['isRead', 'DSC']],
          },
        ],
      });
      const swapCount = await Threads.count({
        where: {
          swapId: {
            $ne: null,
          },
          $or: [
            { host: request.user.id, },
            { guest: request.user.id, },
          ],
          isRead: false,
        },
        include: [
          {
            model: ThreadItems,
            as: 'threadItems',
            require: true,
            where: {
              sentBy: {
                $ne: request.user.id,
              },
              isRead: false,
            },
            order: [['isRead', 'DSC']],
          },
        ],
      });
      let total = hostCount + guestCount + swapCount;

      return {
        hostCount,
        guestCount,
        swapCount,
        total,
      };
    } else {
      return {
        status: 'notLoggedIn',
      };
    }
  },
};
export default getUnreadCount;
