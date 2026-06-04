      *  1         2         3         4         5         6         7
      *890123456789012345678901234567890123456789012345678901234567890123
      * A  |                         B                                 |
      *------------------------------------------------------------------
      ******************************************
      * プログラム名 : ENSHU1
      * 機能 : 集団項目の定義
      ******************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENSHU1.
      
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 EMPLOYEE-DATA.
          03 ENP-ID         PIC 9(8).
          03 ENP-NAME       PIC X(20).
          03 ENP-DEPARTMENT PIC 9(3).
          03 ENP-SALARY     PIC S9(10)V9(2).
