*"* use this source file for your ABAP unit test classes
CLASS zltc_ans_roman_converter DEFINITION FOR TESTING
  RISK LEVEL HARMLESS
  DURATION SHORT.

  PRIVATE SECTION.
    DATA: lr_cut TYPE REF TO zcl_ans_roman_converter.
    METHODS: setup.

    METHODS:
      test_1_conversion FOR TESTING RAISING cx_static_check,
      test_2_conversion FOR TESTING RAISING cx_static_check,
      test_3_conversion FOR TESTING RAISING cx_static_check,
      test_200_conversion FOR TESTING RAISING cx_static_check,
      test_one_less FOR TESTING.
    METHODS: verify_one_less
      IMPORTING roman_num TYPE string
                arabic_num TYPE i.
ENDCLASS.

CLASS zltc_ans_roman_converter IMPLEMENTATION.

  METHOD setup.
    lr_cut = NEW zcl_ans_roman_converter( ).
  ENDMETHOD.

  METHOD test_1_conversion.

    DATA(arb_one) = lr_cut->to_arabic( i_roman_numeral = 'I' ).

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act = arb_one
        exp = 1
    ).

  ENDMETHOD.

  METHOD test_2_conversion.

    DATA(arb_two) = lr_cut->to_arabic( i_roman_numeral = 'II' ).

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act = arb_two
        exp = 2
    ).

  ENDMETHOD.

  METHOD test_3_conversion.

    DATA(arb_three) = lr_cut->to_arabic( i_roman_numeral = 'III' ).

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act = arb_three
        exp = 3
    ).

  ENDMETHOD.

  METHOD test_200_conversion.

    DATA(arb_200) = lr_cut->to_arabic( i_roman_numeral = 'CC' ).

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act = arb_200
        exp = 200
    ).

  ENDMETHOD.

  METHOD verify_one_less.

    cl_abap_unit_assert=>assert_equals(
        act = arabic_num
        exp = lr_cut->to_arabic( i_roman_numeral = roman_num ) ).

  ENDMETHOD.

  METHOD test_one_less.
    verify_one_less( roman_num = 'IV' arabic_num = 4 ).
    verify_one_less( roman_num = 'IX' arabic_num = 9 ).
    verify_one_less( roman_num = 'XC' arabic_num = 90 ).
    verify_one_less( roman_num = 'CD' arabic_num = 400 ).
    verify_one_less( roman_num = 'CM' arabic_num = 900 ).
  ENDMETHOD.

ENDCLASS.
