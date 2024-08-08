import {
    GraphQLObjectType as ObjectType,
    GraphQLInt as IntType,
  } from 'graphql';
  
  
  const ListingSwapCountriesType = new ObjectType({
    name: 'ListingSwapCountries',
    fields: {
        id: {
        type: IntType,
        },
        ListingId: {
        type: IntType,            
        },
        CountryId: {
        type: IntType,
      },
    },
  });
  export default ListingSwapCountriesType;
  