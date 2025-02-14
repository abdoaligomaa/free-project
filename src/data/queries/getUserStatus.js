import UserType from '../types/UserType';
import { User } from '../../data/models';

const getUserStatus = {
  type: UserType,
  async resolve(args,source, { request } , cccc) {
    // Check if user already logged in
    if (request.user && !request.user.admin) {
      const userData = await User.findOne({
        attributes: ['userDeletedAt'],
        where: { id: request.user.id },
      });
      if (userData) {
        if (userData.userDeletedAt != null) {
          return {
            status: 'userDeleted',
            userStatus: true,
          };
        } else {
          return {
            status: 'userNotDeleted',
            userStatus: false,
          };
        }
      }
    } else {
      return {
        status: 'notLoggedIn',
      };
    }
  },
};
export default getUserStatus;
