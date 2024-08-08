import {
    GraphQLObjectType as ObjectType,
    GraphQLString as StringType,
    GraphQLInt as IntType,
} from 'graphql';

const SubguestType = new ObjectType({
    name: 'Subguest',
    fields: {
        id: {
            type: IntType
        },
        email: {
            type: StringType
        },
        reservationId: {
            type: IntType
        },
        userId: {
            type: StringType
        },
        subguestDetailId: {
            type: IntType,
        }

    }
});

export default SubguestType;