      *  1         2         3         4         5         6         7
      *890123456789012345678901234567890123456789012345678901234567890123
      * A  |                         B                                 |
      *------------------------------------------------------------------
      ******************************************
      * プログラム名 : ENSH44
      * 機能 : ファイル読み込みと表示
      ******************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENSHU41.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT  ENPLOYEE-FILE ASSIGN TO ENPLOYEE
                   ORGANIZATION SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD ENPLOYEE-FILE.
       01 WK-ENP.
         03 ENP-ID   PIC X(4).
         03 ENP-NAME PIC N(20).
         03 ENP-DATE PIC 9(8).

       WORKING-STORAGE SECTION.
       01 WK-EOF     PIC X(1) VALUE "N".

       PROCEDURE DIVISION.
           OPEN INPUT ENPLOYEE-FILE.

           READ ENPLOYEE-FILE
               AT END
                  MOVE "Y" TO WK-EOF
           END-READ.

           PERFORM UNTIL WK-EOF = "Y"
               DISPLAY ENP-ID " " ENP-DATE
               READ ENPLOYEE-FILE
                   AT END 
                     MOVE "Y" TO WK-EOF
               END-PERFORM.

           CLOSE ENPLOYEE-FILE.
           STOP RUN.
       