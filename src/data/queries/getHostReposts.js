// GrpahQL
import {
    GraphQLList,
  } from 'graphql';
  
  import { Listing, Repost, RepostFixedPrice, Reposts_Transaction, UserProfile, User } from '../models';
  import AllRepostsType from '../types/AllRepostsType';
  
  const getHostReposts = {
    type: new GraphQLList(AllRepostsType),
  
    async resolve(args,source, { request } , cccc) {
      if (request.user) {
        const userId = request.user.id;
        const userListing = await Listing.findAll({
          where: {
            userId: userId,
          }
        })
        const listingIds = userListing.map((listing) => listing.id);

        const reposts = await Repost.findAll({
          where: {
            listing_id:{$in: listingIds},
            payment_status:'completed',
          },
          order: [['createdAt', 'DESC']],
          raw: true
        });
        const newReposts = [];
        for (let i = 0; i < reposts.length; i++) {
          const repost = reposts[i];
          const gust = await User.findOne({
            attributes: ['email'],
            include: [
              {
                model: UserProfile,
                as: 'profile',
                required: true,
                attributes: ['displayName','picture','profileId'],
              },
            ],
            where: {
              id: repost.userId,
            },
            raw: true,
          });
          // const gust = await UserProfile.find({
          //   where: {
          //     userId: repost.userId
          //   }
          // })
          const oneRepost = {
            id: repost.id,
            startDate: repost.start_date,
            endDate: repost.end_date,
            newNightPrice: repost.new_night_price,
            paymentStatus: repost.payment_status,
            isFixedPrice: repost.isFixedPrice,
            maxRepostPercentage: repost.maxRepostPercentage,
            gustEmail: gust?.email,
            gustName: gust['profile.displayName'],
            gustpicture: gust['profile.picture'],
            gustProfileId: gust['profile.profileId']
          };
          const repostsFixedPrice = await RepostFixedPrice.findAll({
            attributes: ['id', 'repostId', 'from', 'to', 'price'],
            where: {
              repostId: repost.id
            },
            raw: true
          });
          if (repostsFixedPrice.length > 0) {
            oneRepost.fixedPrice = repostsFixedPrice;
          } else {
            oneRepost.fixedPrice = [];
          }
          const listing = await Listing.findOne({
            where: {
              id: repost.listing_id
            },
          });
          if (listing) oneRepost.listingData = listing;
          const repostsTransaction = await Reposts_Transaction.findOne({
            where: {
              repost_id:  repost.id
            },
          });
          if (repostsTransaction) {
            oneRepost.currency = repostsTransaction.currency;
            oneRepost.repostAmount = repostsTransaction.total;
          }
          newReposts.push(oneRepost);
        }
        return newReposts;
      } else {
        return {
          status: 'not loggin',
        };
      }
    },
  };
  
  export default getHostReposts;
  