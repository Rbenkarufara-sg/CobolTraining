      *  1         2         3         4         5         6         7
      *890123456789012345678901234567890123456789012345678901234567890123
      * A  |                         B                                 |
      *------------------------------------------------------------------
      ******************************************
      * プログラム名 : ENSH33
      * 機能 : 繰り返し制御
      ******************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENSHU33.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WK-TEMPERATURE PIC 9(2).
       01 WK-TOTAL       PIC 9(3).

       PROCEDURE DIVISION.
           PERFORM VARYING WK-TEMPERATURE FROM 1 BY 1
                   UNTIL WK-TEMPERATURE > 10
                   ADD WK-TEMPERATURE TO WK-TOTAL
           END-PERFORM.

           DISPLAY WK-TOTAL.
