CLASS zcl_asp_scrabble_score DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS score
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE i.

  PROTECTED SECTION.

  PRIVATE SECTION.

    CONSTANTS: BEGIN OF max_score,
                 _one   TYPE string VALUE `AEIOULNRST`,
                 _two   TYPE string VALUE `DG`,
                 _three TYPE string VALUE `BCMP`,
                 _four  TYPE string VALUE `FHVWY`,
                 _five  TYPE string VALUE `K`,
                 _eight TYPE string VALUE `JX`,
                 _ten   TYPE string VALUE `QZ`,
               END OF max_score.
ENDCLASS.



CLASS zcl_asp_scrabble_score IMPLEMENTATION.

  METHOD score.

    " add solution here
    FINAL(upper_word) = to_upper( input ).

    result = REDUCE i( INIT score = 0
                        FOR i = 0 WHILE i < strlen( upper_word )
                          NEXT score += COND i(
                            WHEN max_score-_one   CS upper_word+i(1) THEN 1
                            WHEN max_score-_two   CS upper_word+i(1) THEN 2
                            WHEN max_score-_three CS upper_word+i(1) THEN 3
                            WHEN max_score-_four  CS upper_word+i(1) THEN 4
                            WHEN max_score-_five  CS upper_word+i(1) THEN 5
                            WHEN max_score-_eight CS upper_word+i(1) THEN 8
                            WHEN max_score-_ten   CS upper_word+i(1) THEN 10 ) ).

  ENDMETHOD.

ENDCLASS.
