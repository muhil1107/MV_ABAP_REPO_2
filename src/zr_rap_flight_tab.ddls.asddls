@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZRAP_FLIGHT_TAB'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_RAP_FLIGHT_TAB
  as select from ZRAP_FLIGHT_TAB
{
  key carrier_id as CarrierID,
  key connection_id as ConnectionID,
  airport_from_id as AirportFromID,
  city_from as CityFrom,
  country_from as CountryFrom,
  airport_to_id as AirportToID,
  price as Price,
  city_to as CityTo,
  country_to as CountryTo,
  airline_name as AirlineName,
  flight_number as FlightNumber,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
}
