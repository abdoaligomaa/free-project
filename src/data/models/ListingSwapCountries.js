import DataType from 'sequelize';
import Model from '../sequelize';

const ListingSwapCountries = Model.define('ListingSwapCountries', {
  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },

  ListingId: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    references: {
      model: 'Listing',
      key: 'id',
    },
  },
  CountryId: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    references: {
      model: 'Country',
      key: 'id',
    },
  },
});

export default ListingSwapCountries;
