CLASS zcl_asp_itab_basic DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: group          TYPE c LENGTH 1,
           BEGIN OF initial_type,
             group        TYPE group,
             number       TYPE i,
             description  TYPE string,
           END OF initial_type,
           itab_data_type TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.

    METHODS:
      fill_itab
        RETURNING
          VALUE(initial_data) TYPE itab_data_type,

      add_to_itab
        IMPORTING
          initial_data        TYPE itab_data_type
        RETURNING
          VALUE(updated_data) TYPE itab_data_type,

      sort_itab
        IMPORTING
          initial_data        TYPE itab_data_type
        RETURNING
          VALUE(updated_data) TYPE itab_data_type,

      search_itab
        IMPORTING
          initial_data        TYPE itab_data_type
        RETURNING
          VALUE(result_index) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_asp_itab_basic IMPLEMENTATION.

  METHOD fill_itab.
    "add solution here
    initial_data = VALUE #( ( group = 'A' number = 10   description = 'Group A-2' )
                            ( group = 'B' number = 5    description = 'Group B'   )
                            ( group = 'A' number = 6    description = 'Group A-1' )
                            ( group = 'C' number = 22   description = 'Group C-1' )
                            ( group = 'A' number = 13   description = 'Group A-3' )
                            ( group = 'C' number = 500  description = 'Group C-2' ) ).

  ENDMETHOD.

  METHOD add_to_itab.

    updated_data = initial_data.

    "add solution here
    APPEND VALUE initial_type( group = 'A' number = 19 description = 'Group A-4' )
    TO updated_data.

    "Note- Could have used INSERT for cleaner approach but then the requirement was to append so,

  ENDMETHOD.

  METHOD sort_itab.

    updated_data = initial_data.

    "add solution here
    SORT updated_data BY group ASCENDING number DESCENDING.

  ENDMETHOD.

  METHOD search_itab.

    DATA(temp_data) = initial_data.

    "add solution here
    result_index = line_index( temp_data[ number = 6 ] ).

  ENDMETHOD.

ENDCLASS.
