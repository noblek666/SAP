@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supp interface View Managed'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_BOOKSUPP_MAN_M
  as select from zbooksupp_man_m
  association to parent ZI_BOOKING_MANJU_M as _Booking on $projection.BookingId = _Booking.BookingId   and $projection.TravelId = _Booking.TravelId                                        
  association [1..1] to ZI_TRAVEL_MANJU_M as _Travel on $projection.TravelId = _Travel.TravelId
  association [1..1] to /DMO/I_Supplement     as _Supplement     on $projection.SupplementId = _Supplement.SupplementID
  association [1..1] to /DMO/I_SupplementText as _SupplementText on $projection.SupplementId = _SupplementText.SupplementID
//  association [0..*] to I_Currency            as _Currency       on $projection.CurrencyCode = _Currency.Currency
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      last_changed_at       as LastChangedAt,
      _Supplement, // Association
      _SupplementText ,// Association
      _Booking,
      _Travel
}
