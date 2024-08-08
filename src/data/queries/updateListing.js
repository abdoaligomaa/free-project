// GrpahQL
import {
  GraphQLList as List,
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLBoolean as BooleanType,
  GraphQLFloat as FloatType,
} from 'graphql';

// GraphQL Type
import EditListingType from '../types/EditListingType';

// Sequelize models
import {
  Listing,
  UserAmenities,
  UserSafetyAmenities,
  UserSpaces,
  UserListingData,
  BedTypes,
  Country,
  Bedrooms,
} from '../../data/models';
import moment from 'moment';
import ListingSwapCountries from '../models/ListingSwapCountries';

const updateListing = {
  type: EditListingType,

  args: {
    id: { type: IntType },
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
    isMapTouched: { type: BooleanType },
    amenities: { type: new List(IntType) },
    safetyAmenities: { type: new List(IntType) },
    spaces: { type: new List(IntType) },
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
      id,
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
      isMapTouched,
      amenities,
      safetyAmenities,
      spaces,
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
    try {
      let isListUpdated = false;

      if (request.user || request.user.admin) {
        let where = { id };
        if (!request.user.admin) {
          where = {
            id,
            userId: request.user.id,
          };
        }

        const getStartDate = startAvailableDate
          ? moment(startAvailableDate).format('YYYY-MM-DD')
          : moment().format('YYYY-MM-DD');

        const values = {
          residenceType: residenceType,
          bedrooms: bedrooms,
          bedType: bedType,
          personCapacity: personCapacity,
          bathrooms: bathrooms,
          country: country,
          street: street,
          buildingName: buildingName,
          city: city,
          state: state,
          zipcode: zipcode,
          lat: lat,
          lng: lng,
          isMapTouched: isMapTouched,
          isRepostAllowed: isRepostAllowed,
          isSwapAllowed: isSwapAllowed,
          startAvailableDate: getStartDate,
        };

        if (maxRepostPercentage) {
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
          if (swapCountryCode !== null)
            values.swapCountryCode = swapCountryCode;
          if (swapCountryName !== null)
            values.swapCountryName = swapCountryName;
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
        
        const doUpdateListing = await Listing.update(values, {
          where,
        }).spread(function (instance) {
          // Check if any rows are affected
          if (instance > 0) {
            isListUpdated = true;
          }
        });

        // User Settings Data
        if (isListUpdated) {
          const removeUserSettingsData = await UserListingData.destroy({
            where: {
              listId: id,
            },
          });

          let otherListSettings = [
            { settingsId: roomType, listId: id },
            { settingsId: houseType, listId: id },
            { settingsId: buildingSize, listId: id },
            { settingsId: bathroomType, listId: id },
          ];

          // Bulk create on UserListingData to store other settings of this listingSteps
          const createOtherSettings = await UserListingData.bulkCreate(
            otherListSettings,
          );

          // Amenities
          if (amenities != null && amenities != undefined) {
            const removeAmenities = await UserAmenities.destroy({
              where: {
                listId: id,
              },
            });
            amenities.map(async (item, key) => {
              let updateAmenities = await UserAmenities.create({
                listId: id,
                amenitiesId: item,
              });
            });
          }

          // Safety Amenities
          if (safetyAmenities != null && safetyAmenities != undefined) {
            const removeSafetyAmenities = await UserSafetyAmenities.destroy({
              where: {
                listId: id,
              },
            });
            safetyAmenities.map(async (item, key) => {
              let updateSafetyAmenities = await UserSafetyAmenities.create({
                listId: id,
                safetyAmenitiesId: item,
              });
            });
          }

          // Spaces
          if (spaces != null && spaces != undefined) {
            const removeSpaces = await UserSpaces.destroy({
              where: {
                listId: id,
              },
            });
            spaces.map(async (item, key) => {
              let updateUserSpaces = await UserSpaces.create({
                listId: id,
                spacesId: item,
              });
            });
          }

          //bedRooms
          const bedroomsCount = parseInt(bedrooms)

          if (bedroomsCount !== null && bedroomsCount > 0 && descriptionsData !== null &&  descriptionsData?.length > 0 && bedroomsBedsData !== null ) {
            const removeRoom = await Bedrooms.destroy({
              where: {
                listId: id,
              },
            });
            const removeBedTypes = await BedTypes.destroy({
              where: {
                listId: id,
              },
            });
            try {
              // items included
              for (let i = 0; i < bedroomsCount; i++) {
                const updateRooms = await Bedrooms.create({
                  listId: id,
                  description: descriptionsData[i]?.description || null,
                  bedRoomNumber: i+1,
                });
              
              //bedroomsBeds
              if (bedroomsBeds && bedroomsBeds.length > 0) {
                  const roomId = updateRooms.dataValues.id;
                  const roomBeds = bedroomsBedsData?.filter(beds => beds.bedroomNumber == i);

                  if (roomBeds != null && roomBeds.length > 0 ) {
                    await Promise.all(
                      roomBeds.map(
                        async ({ bedType, bedroomNumber }, j) => {
                          let updateBedTypes = await BedTypes.create({
                            listId: id,
                            bedCount: j + 1,
                            bedType,
                            bedroomNumber :roomId,
                          });
                        },
                      ),
                    );
                  }
              }
            }
            } catch (error) {
              console.log('bedrooms can not update with this error:',error);
            }   

          }

          // let bedTypeData;
          // if (bedTypes && bedTypes.length > 0) {
          //   bedTypeData = JSON.parse(bedTypes);

          //   // items included
          //   if (bedTypeData != null && bedTypeData != undefined) {
          //     const removeBedTypes = await BedTypes.destroy({
          //       where: {
          //         listId: id,
          //       },
          //     });

          //     await Promise.all(
          //       bedTypeData.map(async (item, key) => {
          //         let updateBedTypes = await BedTypes.create({
          //           listId: id,
          //           bedCount: item.bedCount,
          //           bedType: item.bedType,
          //         });
          //       }),
          //     );
          //   }
          // }

          // Swap Countries        
          if (swapCountryName != null && swapCountryName != undefined) {
            const removeswapCountryName = await ListingSwapCountries.destroy({
              where: {
                ListingId: id,
              },
            });
            const countriesArray = swapCountryName.split(',');
            try {
              for (const countryName of countriesArray) {
                const country = await Country.findOne({where:{countryName:countryName.trim()}})
                if (country) {
                  const CountryId = country.id;
                  const createListingSwapCountry = await ListingSwapCountries.create({
                    ListingId: id,
                    CountryId,
                  })
                } else {
                  console.error(`Country not found for ${countryName}`);
                }
              }
            } catch (error) {
              console.log('listing swap countries updating error:', error);
            }

           
          }       
        }

        if (isListUpdated) {
          return {
            status: 'success',
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
    } catch (error) {
      console.log('error : ', error);
      return {
        status: 'failed',
      };
    }
  },
};

export default updateListing;
