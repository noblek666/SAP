@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Information'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity ZI_FLIGHT_MANJ_R
  as select from /dmo/flight
  association [1..1] to ZI_CARRIER_MANJ_R as _Airline on $projection.CarrierId = _Airline.CarrierId
{

      @UI.lineItem: [{ position: 10 }]
      @ObjectModel.text.association: '_Airline'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
  key carrier_id     as CarrierId,
      @UI.lineItem: [{ position: 20 }]
  key connection_id  as ConnectionId,
      @UI.lineItem: [{ position: 30 }]
  key flight_date    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @UI.lineItem: [{ position: 40 }]
      price          as Price,
      @UI.lineItem: [{ position: 50 }]
      currency_code  as CurrencyCode,
      @UI.lineItem: [{ position: 60 }]

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      plane_type_id  as PlaneTypeId,
      @UI.lineItem: [{ position: 70 }]
      seats_max      as SeatsMax,
      @UI.lineItem: [{ position: 80 }]
      seats_occupied as SeatsOccupied,
      _Airline // Association
}
