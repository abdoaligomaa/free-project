import {
  GraphQLObjectType as ObjectType,
  GraphQLFloat as FloatType,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLBoolean as BooleanType,
  GraphQLList as List,
} from 'graphql';
import moment from 'moment';
import { ListBlockedDates } from '../models';
import ShowListingType from './ShowListingType';

const RepostFixedPriceType = new ObjectType({
  name: 'getRepostFixedPrice',
  fields: {
    id: { type: IntType },
    repostId: { type: IntType },
    from: { type: StringType },
    to: { type: StringType },
    price: { type: FloatType },
  },
});
const RepostSpecialPricingType = new ObjectType({
  name: 'getRepostSpecialPricing',
  fields: {
    blockedDates: { type: StringType },
    isSpecialPrice: { type: FloatType },
  },
});
const AllRepostsType = new ObjectType({
  name: 'getReposts',
  fields: {
    id: { type: IntType },
    startDate: { type: StringType },
    endDate: { type: StringType },
    paymentStatus: { type: StringType },
    currency: { type: StringType },
    repostAmount: { type: FloatType },
    newNightPrice: { type: FloatType },
    isFixedPrice: { type: BooleanType },
    maxRepostPercentage: { type: IntType },
    gustEmail: {type: StringType},
    gustName: {type: StringType},
    gustpicture: {type: StringType },
    gustProfileId:{type: IntType},
    listingData: { type: ShowListingType, },
    fixedPrice: { 
      type: List(RepostFixedPriceType),
    },
    specialPricing: { 
      type: List(RepostSpecialPricingType),
      async resolve(repsot) {
        const listingData = await repsot.listingData.getListingData();

        const listingSpecialPricing = await ListBlockedDates.findAll({
          attributes: ['blockedDates', 'isSpecialPrice', 'calendarStatus'],
          where: {
            listId: repsot.listingData.id,
            blockedDates: {
              $between: [repsot.startDate, repsot.endDate],
            },
            calendarStatus: 'available',
          },
          order: [['blockedDates', 'ASC']],
          raw: true,
        });

        const newSpecialPricing = [];
        const momentStartDate = moment(
          moment(repsot.startDate).format('YYYY-MM-DD'),
        );
        const momentEndDate = moment(
          moment(repsot.endDate).format('YYYY-MM-DD'),
        );
        const dayDifference = momentEndDate.diff(momentStartDate, 'days');
        if (dayDifference > 0) {
          for (let i = 0; i <= dayDifference; i++) {
            let currentDate = moment(repsot.startDate).add(i, 'day').format('YYYY-MM-DD');
            const index = listingSpecialPricing.findIndex(price => moment(price.blockedDates).format('YYYY-MM-DD') === currentDate);            
            newSpecialPricing.push({
              blockedDates: currentDate,
              isSpecialPrice: index >= 0 ? listingSpecialPricing[index].isSpecialPrice : listingData.dataValues.basePrice,
            });
          }
        }

        return newSpecialPricing;
      },
    },
  },
});

export default AllRepostsType;
