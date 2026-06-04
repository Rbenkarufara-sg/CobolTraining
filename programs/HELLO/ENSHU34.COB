      *  1         2         3         4         5         6         7
      *890123456789012345678901234567890123456789012345678901234567890123
      * A  |                         B                                 |
      *------------------------------------------------------------------
      ******************************************
      * プログラム名 : ENSH34
      * 機能 : 制御構造の組み合わせ
      ******************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENSHU34.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WK-NUM PIC 9(3) OCCURS 10 TIMES.
       01 WK-IDX PIC 9(3) VALUE ZERO.
       01 WK-MAX PIC 9(3) VALUE ZERO.
       
       PROCEDURE DIVISION.
           MOVE 11 TO WK-NUM(1).
           MOVE 22 TO WK-NUM(2).
           MOVE 33 TO WK-NUM(3).
           MOVE 44 TO WK-NUM(4).
           MOVE 55 TO WK-NUM(5).
           MOVE 66 TO WK-NUM(6).
           MOVE 77 TO WK-NUM(7).
           MOVE 88 TO WK-NUM(8).
           MOVE 99 TO WK-NUM(9).
           MOVE 00 TO WK-NUM(10).

           MOVE WK-NUM(1) TO WK-MAX.

           PERFORM VARYING WK-IDX FROM 1 BY 1
                   UNTIL WK-IDX > 10 
                IF WK-NUM(WK-IDX) > WK-MAX
                   MOVE WK-NUM(WK-IDX) TO WK-MAX
                END-IF
           END-PERFORM.

           DISPLAY WK-MAX.
