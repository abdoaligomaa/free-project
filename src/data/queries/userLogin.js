// GrpahQL
import {
  GraphQLString as StringType,
  GraphQLNonNull as NonNull,
} from 'graphql';
import userLoginType from '../types/userLoginType';
// Authentication Utils
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { auth } from '../../config-sample';
// Sequelize models
import { User } from '../../data/models';

const userLogin = {
  type: userLoginType,
  args: {
    email: { type: new NonNull(StringType) },
    password: { type: new NonNull(StringType) },
  },
  async resolve(source, { email, password }, { request, response }, cccc) {
    // Check if user already logged in
    if (!request.user) {
      // Check if the user is already exists
      const userLogin = await User.findOne({
        attributes: [
          'id',
          'email',
          'password',
          'userBanStatus',
          'userDeletedAt',
        ],
        where: {
          email: email,
          userDeletedAt: null,
        },
      });
      // Let the user in
      if (userLogin) {
        if (bcrypt.compareSync(password, userLogin.password)) {
          if (userLogin.userBanStatus == 1) {
            return {
              status: 'userbanned',
            };
          } else if (userLogin.userDeletedAt != null) {
            return {
              status: 'userDeleted',
            };
          } else {
            const expiresIn = 60 * 60 * 24 * 180; // 180 days
            const token = jwt.sign(
              { id: userLogin.id, email: userLogin.email },
              auth.jwt.secret,
              { expiresIn },
            );

            response.setHeader('Token', token);
            return {
              status: 'success',
            };
          }
        } else {
          return {
            status: 'password',
          };
        }
      } else {
        return {
          status: 'email',
        };
      }
    } else {
      if (request.user.admin == true) {
        return {
          status: 'adminLoggedIn',
        };
      } else {
        return {
          status: 'loggedIn',
        };
      }
    }
  },
};
export default userLogin;
