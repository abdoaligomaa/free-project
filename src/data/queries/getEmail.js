import UserType from '../types/UserType';
import { User } from '../models';
import { getUserEmail } from '../../core/email/helpers/getUserEmail'
import { GraphQLNonNull as NonNull, GraphQLInt as IntType, GraphQLID as ID  } from 'graphql';


const getEmail = {
  type: UserType,
  args: {
    id: { type: new NonNull(ID) },
       
  },
  async resolve(source, {id}, { request } , cccc) {
    
    const email = await User.findOne({
      attributes: ['email'],
      where: {
        id,
        userBanStatus: {
          $ne: true,
        },
        userDeletedAt: null,
      },
      raw: true,
    });
      return email
    }
  }
export default getEmail;
