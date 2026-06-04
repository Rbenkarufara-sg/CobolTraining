      *  1         2         3         4         5         6         7
      *890123456789012345678901234567890123456789012345678901234567890123
      * A  |                         B                                 |
      *------------------------------------------------------------------
      ******************************************
      * プログラム名 : ENSH43
      * 機能 : レコード件数のカウント
      ******************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENSHU43.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT SHOP-FILE ASSIGN TO SHOP
           ORGANIZATION LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD SHOP-FILE.
       01 SHOP-REC.
         03 ITEM-ID    PIC X(5).
         03 ITEM-NAME  PIC X(20).
         03 ITEM-PRICE PIC 9(8).
       
       WORKING-STORAGE SECTION.
       01 WK-EOF    PIC X(2) VALUE "N".
       01 WK-COUNT  PIC 9(10) VALUE ZERO.

       PROCEDURE DIVISION.
           OPEN INPUT SHOP-FILE.

           READ SHOP-FILE
             AT END MOVE "Y" TO WK-EOF
           END-READ.

           PERFORM UNTIL WK-EOF = "Y"
             DISPLAY ITEM-ID ":" ITEM-NAME ":" ITEM-PRICE
             ADD 1 TO WK-COUNT 
             READ SHOP-FILE
               AT END MOVE "Y" TO WK-EOF
             END-READ
           END-PERFORM.

           DISPLAY "COUNT:" WK-COUNT.

           CLOSE SHOP-FILE.
           STOP RUN.
           