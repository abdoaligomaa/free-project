import UserType from '../types/UserType';

const me = {
  type: UserType,
  resolve(args,source, { request } , cccc) {
    return (
      request.user && {
        id: request.user.id,
        email: request.user.email,
      }
    );
  },
};

export default me;
