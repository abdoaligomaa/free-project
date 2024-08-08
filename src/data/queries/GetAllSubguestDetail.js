import SubguestDetailType from '../types/SubguestDetailType';
import { SubguestDetail } from '../models';

import {
    GraphQLInt as IntType,
    GraphQLNonNull as NonNull
} from 'graphql';

const GetAllSubguestDetail = {

    type: SubguestDetailType,

    args: {
        reservationId: { type: new NonNull(IntType) }
    },

    async resolve(source, { reservationId }, { request } , cccc) {
        try {
            if (reservationId) {
                const reservationData = await SubguestDetail.findAll({
                    where: {
                        reservationId
                    }
                });


                return {
                    reservationData,
                    status: 'success'
                }

            } else {
                return {
                    status: 'noreservationId'
                }
            }
        } catch (err) {
            return "404"

        }
    }
}

export default GetAllSubguestDetail;

