// GrpahQL
import { User } from '../../models';
import Coupon from '../../models/Coupon';
import CouponType from '../../types/CouponType';

import { GraphQLList as List } from 'graphql';
import GetAllCouponType from '../../types/siteadmin/GetAllCouponType';

const getAllUserCoupons = {
    type: new List(CouponType),   
    async resolve(  args,source, { request } , cccc ) {
      console.log('hello');
     
      try {        
        if (request.user) {
          return await Coupon.findAll({
            where: {
              ownerId: request.user.id,             
            },
            order: 'createdAt DESC',
              });                    
        } else {
          return {
            status: 'notLoggedIn',
          };
        }
      } catch (error) {
        return {
          status: 500,
          errorMessage: "Oops! can't get coupons",
        };
      }
    },
  };
  
  export default getAllUserCoupons;
  