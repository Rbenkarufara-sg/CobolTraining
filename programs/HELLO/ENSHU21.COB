      *  1         2         3         4         5         6         7
      *890123456789012345678901234567890123456789012345678901234567890123
      * A  |                         B                                 |
      *------------------------------------------------------------------
      ******************************************
      * プログラム名 : ENSHU21
      * 機能 : MOVE文の基本
      ******************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENSHU21.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WK-ENP-NO   PIC 9(6).
       01 WK-ENP-NAME PIC X(20).
       01 WK-DEPT     PIC X(10).

       PROCEDURE DIVISION.
           MOVE 123 TO WK-ENP-NO.
           MOVE "SUZUKI" TO WK-ENP-NAME.
           MOVE "SALES" TO WK-DEPT.

           DISPLAY "ENP-NO:   ["WK-ENP-NO"]".
           DISPLAY "ENP-NAME: ["WK-ENP-NAME"]".
           DISPLAY "DEPT:     ["WK-DEPT"]".
           STOP RUN.
