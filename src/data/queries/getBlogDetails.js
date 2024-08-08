import { GraphQLList as List } from 'graphql';

// Models
import { BlogDetails } from '../models';

// Types
import BlogDetailsType from '../types/BlogDetailsType';

const getBlogDetails = {
  type: new List(BlogDetailsType),

  async resolve(args,source, { request } , cccc) {
    return await BlogDetails.findAll({});
  },
};

export default getBlogDetails;
