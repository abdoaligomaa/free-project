import CountryType from '../types/CountryType';
import { Country } from '../../data/models';

import { GraphQLList as List } from 'graphql';

const getCountries = {
  type: new List(CountryType),

  async resolve(args,source, { request } , cccc) {
    return await Country.findAll();
  },
};

export default getCountries;
