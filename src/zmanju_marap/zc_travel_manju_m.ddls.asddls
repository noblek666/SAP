@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Project View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_TRAVEL_MANJU_M
  provider contract transactional_query
  as projection on ZI_TRAVEL_MANJU_M
{
  key TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,
//      CreatedBy,
//      CreatedAt,
//      LastChangedBy,
//      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZC_BOOKING_MANJU_M,
      _Currency,
      _Customer,
      _Status
}
