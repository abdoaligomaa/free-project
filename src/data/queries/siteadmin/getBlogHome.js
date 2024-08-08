import { GraphQLString as StringType } from 'graphql';

// Models
import { BlogDetails } from '../../models';

// Types
import BlogDetailsType from '../../types/BlogDetailsType';

const getBlogHome = {
  type: BlogDetailsType,

  args: {
    pageUrl: { type: StringType },
  },

  async resolve(source, { pageUrl }, { request } , cccc) {
    const blogData = await BlogDetails.find({
      where: {
        pageUrl: pageUrl,
        isEnable: true,
      },
    });

    return blogData;
  },
};

export default getBlogHome;
