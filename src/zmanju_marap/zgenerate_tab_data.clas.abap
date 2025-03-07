CLASS zgenerate_tab_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zgenerate_tab_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DELETE FROM zbooking_manju_m.
    DELETE FROM ztravel_manju_m.
    DELETE FROM zbooksupp_man_m.


    DATA : gt_ztravel_manju_m TYPE TABLE OF ztravel_manju_m.
     DATA : gt_zbooking_manju_m TYPE TABLE OF zbooking_manju_m.
     DATA : gt_zbooksupp_man_m TYPE TABLE OF zbooksupp_man_m.
    SELECT  travel_id     AS travel_id             ,
         agency_id     AS agency_id             ,
         customer_id   AS customer_id           ,
         begin_date    AS begin_date            ,
         end_date      AS end_date              ,
         booking_fee   AS booking_fee           ,
         total_price   AS total_price           ,
         currency_code AS currency_code         ,
         description   AS description           ,
         CASE status
           WHEN 'B' THEN 'A' " accepted
           WHEN 'X' THEN 'X' " cancelled
           ELSE 'O'          " open
         END           AS overall_status        ,
         createdby     AS created_by            ,
         createdat     AS created_at            ,
         lastchangedby AS last_changed_by       ,
         lastchangedat AS last_changed_at
         FROM  /dmo/travel AS t1 INTO CORRESPONDING FIELDS OF TABLE @gt_ztravel_manju_m.

    IF gt_ztravel_manju_m IS NOT INITIAL.
      MODIFY ztravel_manju_m FROM TABLE @gt_ztravel_manju_m.
      if sy-subrc = 0.
      out->write( 'ztravel_manju_m : Success' ).
      ENDIF.
      COMMIT WORK.
    ENDIF.

    SELECT * FROM  /dmo/booking AS t1 INTO CORRESPONDING FIELDS OF TABLE @gt_zbooking_manju_m.

    IF gt_zbooking_manju_m IS NOT INITIAL.
      MODIFY zbooking_manju_m FROM TABLE @gt_zbooking_manju_m.
      if sy-subrc = 0.
      out->write( 'zbooking_manju_m : Success' ).
      ENDIF.
      COMMIT WORK.
    ENDIF.



    SELECT * FROM  /dmo/book_suppl AS t1 INTO CORRESPONDING FIELDS OF TABLE @gt_zbooksupp_man_m.

    IF gt_zbooksupp_man_m IS NOT INITIAL.
      MODIFY zbooksupp_man_m FROM TABLE @gt_zbooksupp_man_m.
      if sy-subrc = 0.
      out->write( 'zbooksupp_man_m : Success' ).
      ENDIF.
      COMMIT WORK.
    ENDIF.




  ENDMETHOD.
ENDCLASS.
