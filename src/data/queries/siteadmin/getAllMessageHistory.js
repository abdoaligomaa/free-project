import { Threads } from '../../models';
import ThreadsType from '../../types/ThreadsType';

import { GraphQLList as List } from 'graphql';

const getAllMessageHistory = {
  type: new List(ThreadsType),

  async resolve(args,source, { request } , cccc) {
    return await Threads.findAll({
      order: [['messageUpdatedDate', 'DESC']],
    });
  },
};

export default getAllMessageHistory;
