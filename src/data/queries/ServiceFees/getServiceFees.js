import ServiceFeesType from '../../types/ServiceFeesType';

// Sequelize models
import { ServiceFees } from '../../models';

const getServiceFees = {
  type: ServiceFeesType,

  async resolve(args,source, { request, response } , cccc) {
    return await ServiceFees.findOne();
  },
};

export default getServiceFees;

/**
query getServiceFees{
    getServiceFees{
        id
        guestType
        guestValue
        hostType
        hostValue
        currency
        status
    }
}
**/
