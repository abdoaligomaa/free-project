import { AdminRoles } from '../../../models';
import AdminRolesType from '../../../types/siteadmin/AdminRolesType';

import { GraphQLList as List } from 'graphql';

const getAllAdminRoles = {
  type: new List(AdminRolesType),

  async resolve(args,source, { request } , cccc) {
    return await AdminRoles.findAll({
      order: [['updatedAt', 'DESC']],
    });
  },
};

export default getAllAdminRoles;

/**
query {
  getAllAdminRoles {
    id
    name
    description
    createdAt
    updatedAt
    privileges
  }
}

**/
