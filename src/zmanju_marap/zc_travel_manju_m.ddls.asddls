@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Project View'
@Metadata.allowExtensions: true
define root view entity ZC_TRAVEL_MANJU_M
  provider contract transactional_query
  as projection on ZI_TRAVEL_MANJU_M
{
  key TravelId,

      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyId,
      _Agency.Name       as AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      OverallStatus,
      _Status._Text.Text as OverallStatusText : localized,
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
