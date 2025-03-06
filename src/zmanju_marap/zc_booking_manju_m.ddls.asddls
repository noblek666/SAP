@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bokking Projection View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_BOOKING_MANJU_M as projection on ZI_BOOKING_MANJU_M
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _Booking_Status,
    _BookSupp  : redirected to composition child ZC_BOOKSUPP_MAN_M,
    _Carrier,
    _Connection,
    _Customer,
    _Travel : redirected to parent ZC_TRAVEL_MANJU_M 
}
