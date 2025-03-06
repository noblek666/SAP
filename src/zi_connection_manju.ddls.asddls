@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection View CDS Data Model'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@UI.headerInfo:{
typeName:'Connection',
typeNamePlural: 'Connections'
 }
define view entity ZI_CONNECTION_MANJU
  as select from /dmo/connection as Connection

{

      @UI.facet: [{ purpose: #STANDARD, type: #IDENTIFICATION_REFERENCE, position: 10, label: 'Connection Details'  }]
      @UI.lineItem: [{ position: 10 , label: 'Carrier ID'}]
      @UI.selectionField: [{ position: 10 }]
      @UI.identification: [{ position: 10 }]
  key carrier_id      as CarrierId,
      @UI.lineItem: [{ position: 20 , label: 'Connection ID'}]
      @UI.selectionField: [{ position: 20 }]
      @UI.identification: [{ position: 20,label: 'Connection' }]
  key connection_id   as ConnectionId,
      @UI.lineItem: [{ position: 30 ,label: 'Starting Point' }]
      @UI.selectionField: [{ position: 30 }]
      @UI.identification: [{ position: 30 }]
      airport_from_id as AirportFromId,
      @UI.lineItem: [{ position: 40 ,label: 'End Point'  }]
      @UI.selectionField: [{ position: 40 }]
      @UI.identification: [{ position: 40 }]
      airport_to_id   as AirportToId,
      @UI.lineItem: [{ position: 50 ,label: 'Starting Time' }]
      @UI.identification: [{ position: 50 }]
      departure_time  as DepartureTime,
      @UI.lineItem: [{ position: 60 ,label: 'End Time' }]
      @UI.identification: [{ position: 60 }]
      arrival_time    as ArrivalTime,
      @UI.lineItem: [{ position: 70 , label: 'Distance'}]
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      @UI.identification: [{ position: 70 }]
      distance        as Distance,
      distance_unit   as DistanceUnit
}
