import DataType from 'sequelize';
import Model from '../sequelize';
import bcrypt from 'bcryptjs';

const Listing = Model.define('Listing', {
  id: {
    type: DataType.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },

  userId: {
    type: DataType.UUID,
    allowNull: false,
  },

  title: {
    type: DataType.STRING,
  },

  description: {
    type: DataType.TEXT,
  },

  residenceType: {
    type: DataType.STRING,
  },

  bedrooms: {
    type: DataType.STRING,
  },

  beds: {
    type: DataType.INTEGER,
  },

  personCapacity: {
    type: DataType.INTEGER,
  },

  bathrooms: {
    type: DataType.FLOAT,
  },

  country: {
    type: DataType.STRING,
  },

  street: {
    type: DataType.STRING,
  },

  buildingName: {
    type: DataType.STRING,
  },

  city: {
    type: DataType.STRING,
  },

  state: {
    type: DataType.STRING,
  },

  zipcode: {
    type: DataType.STRING,
  },

  lat: {
    type: DataType.FLOAT,
  },

  lng: {
    type: DataType.FLOAT,
  },

  coverPhoto: {
    type: DataType.INTEGER,
  },

  isMapTouched: {
    type: DataType.BOOLEAN,
    defaultValue: false,
  },

  bookingType: {
    type: DataType.ENUM('request', 'instant'),
    defaultValue: 'instant',
    allowNull: false,
  },

  isAccepted: {
    type: DataType.BOOLEAN,
    defaultValue: false,
    allowNull: false,
  },

  isPublished: {
    type: DataType.BOOLEAN,
    defaultValue: false,
    allowNull: false,
  },

  isReady: {
    type: DataType.BOOLEAN,
    defaultValue: false,
    allowNull: false,
  },

  reviewsCount: {
    type: DataType.BOOLEAN,
    defaultValue: 0,
  },

  listApprovalStatus: {
    type: DataType.STRING,
    defaultValue: null,
  },

  isRepostAllowed: {
    type: DataType.BOOLEAN,
    defaultValue: false
  },

  maxRepostPercentage: {
    type: DataType.INTEGER,
    defaultValue: 30
  },

  isSwapAllowed: {
    type: DataType.BOOLEAN,
    defaultValue: false
  },

  swapAllowAnyDate: {
    type: DataType.BOOLEAN,
    defaultValue: true
  },

  swapStartDate: {
    type: DataType.STRING,
    allowNull: true,
  },

  swapEndDate: {
    type: DataType.STRING,
    allowNull: true,
  },

  swapCountryCode: {
    type: DataType.STRING,
    allowNull: true,
  },

  swapCountryName: {
    type: DataType.STRING,
    allowNull: true,
  },

  swapCity: {
    type: DataType.STRING,
    allowNull: true,
  },
  
  startAvailableDate: {
    type: DataType.STRING,
    allowNull: false,
  },
  additionalTitle: {    
    type: DataType.STRING,
  },
  additionalDescription: {    
    type: DataType.TEXT,
  },
  additionalCoverPhoto: {    
    type: DataType.INTEGER,
  },
  reviewed: {    
    type: DataType.BOOLEAN,
    defaultValue: false,    
    allowNull: false,
  },
});

export default Listing;
