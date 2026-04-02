@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZRAP_FLIGHT_TAB'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_RAP_FLIGHT_TAB
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_RAP_FLIGHT_TAB
  association [1..1] to ZR_RAP_FLIGHT_TAB as _BaseEntity on $projection.CARRIERID = _BaseEntity.CARRIERID and $projection.CONNECTIONID = _BaseEntity.CONNECTIONID
{
  key CarrierID,
  key ConnectionID,
  AirportFromID,
  CityFrom,
  CountryFrom,
  AirportToID,
  Price,
  CityTo,
  CountryTo,
  AirlineName,
  FlightNumber,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Lastchangedby: true
  }
  LastChangedBy,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  _BaseEntity
}
