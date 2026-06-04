      *  1         2         3         4         5         6         7
      *890123456789012345678901234567890123456789012345678901234567890123
      * A  |                         B                                 |
      *------------------------------------------------------------------
      ******************************************
      * プログラム名 : ENSHU4
      * 機能 : OCCURS句を使った配列
      ******************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENSHU4.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ENPROYEE-TABLE.
         03 ENP-ENTRY OCCURS 5 TIMES.
           05 MENBER-ID PIC 9(6).
           05 NEME      PIC X(20).
