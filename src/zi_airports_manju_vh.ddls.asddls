@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help for airports'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity ZI_AIRPORTS_MANJU_VH as select from /dmo/airport
{

    @Search.defaultSearchElement: true
    key airport_id as AirportId,
    
    @Search.defaultSearchElement: true
    
    name as Name,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    city as City,
    @Search.defaultSearchElement: true
     @Search.fuzzinessThreshold: 0.8
    country as Country
}
