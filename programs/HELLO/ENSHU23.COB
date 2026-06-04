      *  1         2         3         4         5         6         7
      *890123456789012345678901234567890123456789012345678901234567890123
      * A  |                         B                                 |
      *------------------------------------------------------------------
      ******************************************
      * プログラム名 : ENSHU23
      * 機能 : OF修飾
      ******************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENSHU23.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 INPUT-DATA.
         03 ITEM-CODE PIC X(5).
         03 ITEM-NAME PIC X(20).
       01 OUTPUT-DATA.
         03 ITEM-CODE PIC X(5).
         03 ITEM-NAME PIC X(20).
      
       PROCEDURE DIVISION.
           MOVE "25" TO ITEM-CODE OF INPUT-DATA.
           MOVE "TANAKA" TO ITEM-NAME OF INPUT-DATA.

           MOVE ITEM-CODE OF INPUT-DATA TO ITEM-CODE OF OUTPUT-DATA.
           MOVE ITEM-NAME OF INPUT-DATA TO ITEM-NAME OF OUTPUT-DATA.

           DISPLAY "CODE:" ITEM-CODE OF OUTPUT-DATA.
           DISPLAY "NEME:" ITEM-NAME OF OUTPUT-DATA.
