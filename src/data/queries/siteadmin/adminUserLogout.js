import AdminUserLogoutType from '../../types/siteadmin/AdminUserLogoutType';

// TODO: remove this later. and handle it on the frontend.
const adminUserLogout = {
  type: AdminUserLogoutType,

  async resolve(args,source, { request, response } , cccc) {
    try {
      return {
        status: 200,
      };
    } catch (error) {
      return {
        status: 400,
      };
    }
  },
};

export default adminUserLogout;
