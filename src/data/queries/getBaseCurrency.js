import CurrenciesType from '../types/CurrenciesType';
import { Currencies } from '../../data/models';

const getBaseCurrency = {
  type: CurrenciesType,

  async resolve(args,source, { request } , cccc) {
    return await Currencies.find({
      where: {
        isBaseCurrency: true,
      },
    });
  },
};

export default getBaseCurrency;
