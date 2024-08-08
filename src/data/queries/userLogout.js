import userLogoutType from '../types/userLogoutType';

// TODO: remove this later. and handle it on the frontend
const userLogout = {
  type: userLogoutType,
  async resolve(args,source, { request, response } , cccc) {
    try {
      return {
        status: 'success',
      };
    } catch (error) {
      return {
        status: 'failed',
      };
    }
  },
};

export default userLogout;
