// GrpahQL
import {
  GraphQLList as List,
  GraphQLString as StringType,
  GraphQLInt as IntType,
} from 'graphql';
import moment from 'moment';
import { User } from '../../../models';
import Coupon from '../../../models/Coupon';
import GetAllCouponType from '../../../types/siteadmin/GetAllCouponType';

const getAllCoupons = {
  type: GetAllCouponType,

  args: {
    currentPage: { type: IntType },
    searchList: { type: StringType },
  },

  async resolve(source, { currentPage, searchList }, { request } , cccc) {
    if (request.user && request.user.admin == true) {
      const limit = 10;
      let offset = 0;
      // Offset from Current Page
      if (currentPage) {
        offset = (currentPage - 1) * limit;
      }
      let getAllCoupons, couponCountLength, where;
      if (searchList) {
        let getDate = moment(searchList).format('YYYY-MM-DD');
        where = {
          $or: [
            {
              code: {
                $like: '%' + searchList + '%',
              },
            },
            {
              description: {
                $like: '%' + searchList + '%',
              },
            },
            {
              type: {
                $like: '%' + searchList + '%',
              },
            },
            {
              amount: {
                $like: '%' + searchList + '%',
              },
            },
            {
              maxNumberOfUsage: {
                $like: '%' + searchList + '%',
              },
            },
            {
              maxNumberOfUsage: {
                $like: '%' + searchList + '%',
              },
            },
            {
              stratDate: {
                $in: [
                  sequelize.literal(`
                  SELECT
                  createdAt
                  FROM
                      Coupon
                  WHERE createdAt like '%${getDate}%'
                `),
                ],
              },
            },
            {
              endDate: {
                $in: [
                  sequelize.literal(`
                  SELECT
                  createdAt
                  FROM
                      Coupon
                  WHERE createdAt like '%${getDate}%'
                `),
                ],
              },
            },
            {
              createdAt: {
                $in: [
                  sequelize.literal(`
                  SELECT
                  createdAt
                  FROM
                      Coupon
                  WHERE createdAt like '%${getDate}%'
                `),
                ],
              },
            },
            // {
            //   targetId: {
            //     $in: [
            //       sequelize.literal(`
            //       SELECT
            //           userId
            //       FROM
            //           UserProfile
            //       WHERE firstName like '%${searchList}%'
            //     `),
            //     ],
            //   },
            // },
            // {
            //   userId: {
            //     $in: [
            //       sequelize.literal(`
            //       SELECT
            //           id
            //       FROM
            //           User
            //       WHERE email like '%${searchList}%'
            //     `),
            //     ],
            //   },
            // },
          ],
        };
        couponCountLength = await Coupon.count({
          where,
        });
        getAllCoupons = await Coupon.findAll({
          limit,
          offset,
          order: [['id', 'ASC']],
          where,
          include: [
            {
              model: User,
              as: 'users',
            },
          ],
          /*where: {
            isPublished: true
          }*/
        });
      } else {
        couponCountLength = await Coupon.count();
        getAllCoupons = await Coupon.findAll({
          limit,
          offset,
          order: [['id', 'ASC']],
          include: [
            {
              model: User,
              as: 'users',
            },
          ],
          /*where: {
            isPublished: true
          }*/
        });
      }

      return {
        couponsData: getAllCoupons,
        count: couponCountLength,
      };
    } else {
      return {
        status: 401,
        errorMessage: 'Oops! Please login and continue.',
      };
    }
  },
};

export default getAllCoupons;
