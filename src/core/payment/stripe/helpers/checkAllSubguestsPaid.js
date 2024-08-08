import { SubguestDetail } from "../../../../data/models";

export async function checkAllSubguestsPaid(reservationId) {
    const { count } = await SubguestDetail.findAndCount({
        where: {
            reservationId,
            status: "pending"
        }
    })
    return count === 0
}