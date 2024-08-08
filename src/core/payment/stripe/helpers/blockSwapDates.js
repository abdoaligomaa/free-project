import { ListBlockedDates, Swap } from '../../../../data/models';
import moment from 'moment';
import sequelize from 'sequelize';

export async function blockSwapDates(swapId, reservationId) {
  var dates = [];
  const swap = await Swap.findOne({
    where: {
      id: swapId,
    },
  });

  if (swap) {
    var dates = [];
    var start = new Date(swap.checkIn);
    var end = new Date(swap.checkOut);
    var copy = new Date(start);
    let endTimevalue = end.setDate(end.getDate() - 1);
    let endTime = new Date(endTimevalue);
    dates.push(copy);
    while (start <= endTime) {
      dates.push(start);
      var newDate = start.setDate(start.getDate() + 1);
      start = new Date(newDate);
    }

    let day;
    let listBlockedDates;
    dates.map(async blockedDates => {
      day = moment(blockedDates).format('YYYY-MM-DD');
      let dayList = sequelize.where(
        sequelize.fn('DATE', sequelize.col('blockedDates')),
        day,
      );
      const hostBlockedDatesWhere = {
        blockedDates: dayList,
        listId: swap.hostListId,          
      };
      if (reservationId) {
        hostBlockedDatesWhere.calendarStatus = 'blocked';
        hostBlockedDatesWhere.reservationId = reservationId;
      } else {
        hostBlockedDatesWhere.calendarStatus = 'available';
      }
      let hostBlockedDatesFind = await ListBlockedDates.findAll({
        where: hostBlockedDatesWhere,
      });
      let guestBlockedDatesFind = await ListBlockedDates.findAll({
        where: {
          blockedDates: dayList,
          listId: swap.guestListId,
          calendarStatus: 'available',
        },
      });
      let blockfindDates, createdDates, updateDates;
      let chooseDates = moment(moment(blockedDates)).format('YYYY-MM-DD');

      hostBlockedDatesFind.map(async (value, keys) => {
        blockfindDates = moment(value.blockedDates).format('YYYY-MM-DD');
        if (chooseDates == blockfindDates) {
          updateDates = await ListBlockedDates.update(
            {
              listId: swap.hostListId,
              blockedDates: blockedDates,
              calendarStatus: 'blocked',
              swapId,
            },
            {
              where: {
                listId: swap.hostListId,
                blockedDates: dayList,
              },
            },
          );
        } else {
          createdDates = await ListBlockedDates.create({
            listId: swap.hostListId,
            blockedDates: blockedDates,
            calendarStatus: 'blocked',
            swapId,
          });
        }
      });

      guestBlockedDatesFind.map(async (value, keys) => {
        blockfindDates = moment(value.blockedDates).format('YYYY-MM-DD');
        if (chooseDates == blockfindDates) {
          updateDates = await ListBlockedDates.update(
            {
              listId: swap.guestListId,
              blockedDates: blockedDates,
              calendarStatus: 'blocked',
              swapId,
            },
            {
              where: {
                listId: swap.guestListId,
                blockedDates: dayList,
              },
            },
          );
        } else {
          createdDates = await ListBlockedDates.create({
            listId: swap.guestListId,
            blockedDates: blockedDates,
            calendarStatus: 'blocked',
            swapId,
          });
        }
      });

      if (hostBlockedDatesFind.length == 0) {
        createdDates = await ListBlockedDates.create({
          listId: swap.hostListId,
          blockedDates: blockedDates,
          calendarStatus: 'blocked',
          swapId,
        });
      }
      if (guestBlockedDatesFind.length == 0) {
        createdDates = await ListBlockedDates.create({
          listId: swap.guestListId,
          blockedDates: blockedDates,
          calendarStatus: 'blocked',
          swapId,
        });
      }
    });
  }
}
