      *  1         2         3         4         5         6         7
      *890123456789012345678901234567890123456789012345678901234567890123
      * A  |                         B                                 |
      *------------------------------------------------------------------
      ******************************************
      * プログラム名 : ENSH31
      * 機能 : 順次制御
      ******************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENSHU33.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WK-PRICE PIC 9(8).
       01 WK-QTY   PIC 9(4).
       01 WK-TOTAL PIC 9(12).

       PROCEDURE DIVISION.
           MOVE 5000 TO WK-PRICE.
           MOVE 3 TO WK-QTY.

           COMPUTE WK-TOTAL = WK-PRICE * WK-QTY.

           DISPLAY WK-TOTAL.
