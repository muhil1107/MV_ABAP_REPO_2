CLASS LHC_ZR_RAP_FLIGHT_TAB DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrRapFlightTab
        RESULT result.
        methods deter FOR DETERMINE ON MODIFY
            IMPORTING keys FOR ZrRapFlightTab~deter.

          METHODS valitate FOR VALIDATE ON SAVE
            IMPORTING keys FOR ZrRapFlightTab~valitate.
ENDCLASS.

CLASS LHC_ZR_RAP_FLIGHT_TAB IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD deter.

  read ENTITIES OF zr_rap_flight_tab IN LOCAL MODE ENTITY ZrRapFlightTab FIELDS ( AirportFromID  AirportToID )
  WITH CORRESPONDING #( KEYS ) RESULT data(res).

  loop at res into data(lt).

    select single from /dmo/airport fields city , country where airport_id = @lt-AirportFromID into @data(wa).

    select single from /dmo/airport fieLDS city , country where airport_id = @lt-AirportToID into @data(wa1).

    modify ENTITIES OF zr_rap_flight_tab IN LOCAL MODE ENTITY ZrRapFlightTab UPDATE FIELDS ( CityFrom CityTo CountryFrom CountryTo ) WITH
    value #(
    (
    %tky = lt-%tky
    CityFrom = wa-city
    CityTo = wa1-city
    CountryFrom = wa-country
    CountryTo = wa1-country
    )
    ).

  endloop.

  ENDMETHOD.

  METHOD valitate.

  read ENTITIES OF zr_rap_flight_tab IN LOCAL MODE ENTITY ZrRapFlightTab FIELDS ( AirportFromID  AirportToID )
  WITH CORRESPONDING #( KEYS ) RESULT data(res).

  loop at res into data(wa).

    select sinGLE from /dmo/connection fiELDS airport_from_id, airport_to_id
    where airport_from_id = @wa-AirportFromID and airport_to_id = @wa-AirportToID
    into @data(lt1).

    if sy-subrc <> 0 .

         append vaLUE #( %tky = wa-%tky ) to failed-zrrapflighttab.

    append value #( %tky = wa-%tky
                    %msg = new_message(
                            id = 'Z_MSG_RAP_01'
                            number = '001'
                            v1 = 'Invalid AirportFrom and AirportTo Id check'
                            severity = if_abap_behv_message=>severity-error
                            )
                  ) to reported-zrrapflighttab.

    endif.


  endloop.

  ENDMETHOD.

ENDCLASS.
