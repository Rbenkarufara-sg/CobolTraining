      *  1         2         3         4         5         6         7
      *890123456789012345678901234567890123456789012345678901234567890123
      * A  |                         B                                 |
      *------------------------------------------------------------------
      ******************************************
      * プログラム名 : ENSHU3
      * 機能 : REDEFINES句の活用
      ******************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENSHU3.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WK-DATE PIC 9(8).
       01 WK-DATES REDEFINES WK-DATE.
         03 YEAR  PIC 9(4).
         03 MONTH PIC 9(2).
         03 DAYS  PIC 9(2).
