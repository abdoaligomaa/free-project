// GrpahQL
import {
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLFloat as FloatType,
  GraphQLBoolean as BooleanType,
  GraphQLList as ListType,
  GraphQLObjectType as ObjectType,
} from 'graphql';

// GraphQL Type
import CreateListingType from '../types/CreateListingType';

// Sequelize models
import { Listing, UserListingData, BedTypes,  Country, Bedrooms } from '../../data/models';

import fetch from '../../core/fetch';
import moment from 'moment';
import ListingSwapCountries from '../models/ListingSwapCountries';

const createListing = {
  type: CreateListingType,

  args: {
    roomType: { type: StringType },
    houseType: { type: StringType },
    residenceType: { type: StringType },
    bedrooms: { type: StringType },
    buildingSize: { type: StringType },
    bedType: { type: StringType },
    personCapacity: { type: IntType },
    bathrooms: { type: FloatType },
    bathroomType: { type: StringType },
    country: { type: StringType },
    street: { type: StringType },
    buildingName: { type: StringType },
    city: { type: StringType },
    state: { type: StringType },
    zipcode: { type: StringType },
    lat: { type: FloatType },
    lng: { type: FloatType },
    bedTypes: { type: StringType },
    isRepostAllowed: { type: BooleanType },
    maxRepostPercentage: { type: IntType },
    isSwapAllowed: { type: BooleanType },
    swapAllowAnyDate: { type: BooleanType },
    swapStartDate: { type: StringType },
    swapEndDate: { type: StringType },
    swapCountryCode: { type: StringType },
    swapCountryName: { type: StringType },
    swapCity: { type: StringType },
    startAvailableDate: { type: StringType },
    bedroomsBeds: { type: StringType },
    descriptions: { type: StringType },
  },

  async resolve(source,{
      roomType,
      houseType,
      residenceType,
      bedrooms,
      buildingSize,
      bedType,
      personCapacity,
      bathrooms,
      bathroomType,
      country,
      street,
      buildingName,
      city,
      state,
      zipcode,
      lat,
      lng,
      bedTypes,
      isRepostAllowed,
      maxRepostPercentage,
      isSwapAllowed,
      swapAllowAnyDate,
      swapStartDate,
      swapEndDate,
      swapCountryCode,
      swapCountryName,
      swapCity,
      startAvailableDate,
      bedroomsBeds,
      descriptions,
    }, { request, response }, ccc) {
    if (request.user && request.user.admin != true) {
      const address =
        street + ', ' + city + ', ' + state + ', ' + country + ', ' + zipcode;

      const query = `
        query ($address: String) {
          locationItem(address: $address) {
            street
            city
            state
            country
            zipcode
            lat
            lng
          }
        }
      `;

      const resp = await fetch('/graphql', {
        method: 'post',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          query: query,
          variables: { address: address },
        }),
        credentials: 'include',
      });

      const { data } = await resp.json();

      let latValue = lat;
      let lngValue = lng;

      if (data.locationItem != null) {
        latValue = data.locationItem.lat;
        lngValue = data.locationItem.lng;
      }

      const getStartDate = startAvailableDate
        ? moment(startAvailableDate).format('YYYY-MM-DD')
        : moment().format('YYYY-MM-DD');

      const values = {
        userId: request.user.id,
        residenceType: residenceType,
        bedrooms: bedrooms,
        personCapacity: personCapacity,
        bathrooms: bathrooms,
        country: country,
        street: street,
        buildingName: buildingName,
        city: city,
        state: state,
        zipcode: zipcode,
        lat: latValue,
        lng: lngValue,
        isRepostAllowed: isRepostAllowed,
        maxRepostPercentage: 0,
        isSwapAllowed: isSwapAllowed,
        startAvailableDate: getStartDate,
        isMapTouched: true
      };

      if (
        maxRepostPercentage &&
        isRepostAllowed !== null &&
        isRepostAllowed === true
      ) {
        values.maxRepostPercentage = maxRepostPercentage;
      }

      if (isSwapAllowed === true) {
        if (swapAllowAnyDate !== null)
          values.swapAllowAnyDate = swapAllowAnyDate;
        if (swapStartDate !== null) values.swapStartDate = swapStartDate;
        if (swapEndDate !== null) values.swapEndDate = swapEndDate;
        if (swapStartDate !== null && swapStartDate === 'null')
          values.swapStartDate = null;
        if (swapEndDate !== null && swapEndDate === 'null')
          values.swapEndDate = null;
        if (swapCountryCode !== null) values.swapCountryCode = swapCountryCode;
        if (swapCountryName !== null) values.swapCountryName = swapCountryName;
        if (swapCountryCode !== null && swapCountryCode === 'null')
          values.swapCountryCode = null;
        if (swapCountryName !== null && swapCountryName === 'null')
          values.swapCountryName = null;
        if (swapCity !== null) values.swapCity = swapCity;
        if (swapCity !== null && swapCity === 'null') values.swapCity = null;
      }

      let bedroomsBedsData = JSON.parse(bedroomsBeds || null);
      let descriptionsData = JSON.parse(descriptions || null);

      if (bedroomsBeds?.length > 0) {
        values.beds = bedroomsBedsData?.length;
      }

      const doCreateListing = await Listing.create(values);
      if (doCreateListing) {
        const countriesArray = doCreateListing.swapCountryName?.split(',') || [];
        const ListingId = doCreateListing.id;
        try {
          for (const countryName of countriesArray) {
            const country = await Country.findOne({where:{countryName:countryName.trim()}})
            if (country) {
              const CountryId = country.id;
              const createListingSwapCountry = await ListingSwapCountries.create({
                ListingId,
                CountryId,
              })
            } else {
              console.error(`Country not found for ${countryName}`);
            }
          }
        } catch (error) {
          console.log('listing swap countries crateting error:', error);
        }
      }
    
      if (doCreateListing) {
        // Recently added list id
        const id = doCreateListing.dataValues.id;
        const bedroomsCount = parseInt(bedrooms)
        if (bedroomsCount !== null && bedroomsCount > 0) {         
          try {
            for (let i = 0; i < bedroomsCount; i++) {
              const updateRooms = await Bedrooms.create({
                listId: id,
                description: descriptionsData[i]?.description || null,
                bedRoomNumber: i+1,
              });

              if (bedroomsBeds && bedroomsBeds.length > 0) {
                // Recently added room id
                const roomId = updateRooms.dataValues.id;
                const roomBeds = bedroomsBedsData?.filter(beds => beds.bedroomNumber == i);

                // items included
                if (bedroomsBedsData != null && bedroomsBedsData != undefined) {
                  const removeBedTypes = await BedTypes.destroy({
                    where: {
                      listId: id,
                      bedroomNumber:roomId,
                    },
                  });
                  if (roomBeds != null && roomBeds.length > 0 ) {
                    await Promise.all(
                      roomBeds.map(
                        async ({ bedType, bedroomNumber }, j) => {
                          let updateBedTypes = await BedTypes.create({
                            listId: id,
                            bedCount: j + 1,
                            bedType,
                            bedroomNumber : roomId,
                          });
                        },
                      ),
                    );                 
                  }
                }
              }              
            }
          } catch (error) {
            console.log('bedrooms can not creat with this error:',error);
          }        
        }
        console.log('id : ', roomType, buildingSize, bathroomType);
        // Assign other settings values in here
        let otherListSettings = [
          { settingsId: roomType, listId: id },
          { settingsId: houseType, listId: id },
          { settingsId: buildingSize, listId: id },
          // { settingsId: bedType, listId: id },
          { settingsId: bathroomType, listId: id },
        ];

        // Bulk create on UserListingData to store other settings of this listingSteps
        const createOtherSettings = await UserListingData.bulkCreate(
          otherListSettings,
        );

        return {
          status: 'success',
          id: id,
        };
      } else {
        return {
          status: 'failed',
        };
      }
    } else {
      return {
        status: 'notLoggedIn',
      };
    }
  },
};

export default createListing;
