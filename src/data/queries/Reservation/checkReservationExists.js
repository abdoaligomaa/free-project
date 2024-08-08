import ReservationType from "../../types/ReservationType";

import {
    GraphQLString as StringType
} from 'graphql';
import { Reservation } from "../../models";

const checkReservationExists = {
    type: ReservationType,
    args: {
        reservationId: { type: StringType }
    },
    async resolve(source, { reservationId }, { request } , cccc) {
        return await Reservation.findById(reservationId)
    }
}
export default checkReservationExists