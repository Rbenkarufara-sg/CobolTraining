      *  1         2         3         4         5         6         7
      *890123456789012345678901234567890123456789012345678901234567890123
      * A  |                         B                                 |
      *------------------------------------------------------------------
      ******************************************
      * プログラム名 : ENSH32
      * 機能 : 選択制御
      ******************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENSHU32.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WK-TEMPLERATURE PIC 9(3).

       PROCEDURE DIVISION.
           MOVE 24 TO WK-TEMPLERATURE.

           EVALUATE  TRUE
             WHEN WK-TEMPLERATURE >= 35
                  DISPLAY "VERY HOT"
             WHEN WK-TEMPLERATURE >= 25
                  DISPLAY "WARM"
             WHEN WK-TEMPLERATURE >= 15
                  DISPLAY "COOL" 
             WHEN WK-TEMPLERATURE <= 15
                  DISPLAY "COLD"
           END-EVALUATE.
