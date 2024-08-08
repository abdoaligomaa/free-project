'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    return queryInterface.sequelize.transaction(async t => {
      const beds = await queryInterface.rawSelect(
        'BedTypes',
        {
          where: { bedroomNumber: { $ne: null } },
          plain: false,
        },
        ['id'],
      );

      const listingRoomNumber = beds.reduce((acc, cur) => {
        acc[cur.listId]
          ? (acc[cur.listId][cur.bedroomNumber] = true)
          : (acc[cur.listId] = { [cur.bedroomNumber]: true });

        return acc;
      }, {});

      const bedrooms = [];
      const now = new Date().toISOString();

      for (const listId in listingRoomNumber) {
        if (Object.hasOwnProperty.call(listingRoomNumber, listId)) {
          const bedroomNumbers = Object.keys(listingRoomNumber[listId]);

          bedroomNumbers.forEach(bedRoomNumber => {
            bedrooms.push({
              listId,
              bedRoomNumber,
              createdAt: now,
              updatedAt: now,
            });
          });
        }
      }

      await queryInterface.bulkInsert('Bedrooms', bedrooms);

      const rooms = await queryInterface.rawSelect(
        'Bedrooms',
        { plain: false },
        ['id'],
      );

      await Promise.all(
        beds.map(bed => {
          const room = rooms.find(el => {
            return (
              el.listId == bed.listId && el.bedRoomNumber == bed.bedroomNumber
            );
          });

          return queryInterface.sequelize.query(
            `UPDATE BedTypes SET bedroomNumber = ${room.id} WHERE id = ${bed.id}`,
          );
        }),
      );

      await queryInterface.changeColumn('BedTypes', 'bedroomNumber', {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Bedrooms',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      });
    });
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.sequelize.query(
      'ALTER TABLE BedTypes DROP CONSTRAINT bedroomNumber_foreign_idx;'
    );

    const beds = await queryInterface.rawSelect(
      'BedTypes',
      {
        where: { bedroomNumber: { $ne: null } },
        plain: false,
      },
      ['id'],
    );

    const rooms = await queryInterface.rawSelect('Bedrooms', { plain: false }, [
      'id',
    ]);

    await Promise.all(
      beds.map(bed => {
        const room = rooms.find(el => el.id == bed.bedroomNumber);

        return queryInterface.sequelize.query(
          `UPDATE BedTypes SET bedroomNumber = ${room.bedRoomNumber} WHERE id = ${bed.id}`,
        );
      }),
    );
    
    await queryInterface.bulkDelete('Bedrooms');
  },
};
