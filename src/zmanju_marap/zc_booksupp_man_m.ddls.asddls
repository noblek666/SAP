@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Project View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_BOOKSUPP_MAN_M 

as projection on ZI_BOOKSUPP_MAN_M
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking :redirected to parent ZC_BOOKING_MANJU_M,
    _Travel : redirected to ZC_TRAVEL_MANJU_M,
    _Supplement,
    _SupplementText
}
