       IDENTIFICATION DIVISION.
       PROGRAM-ID. KJBM010.
      ******************************************************************
      *システム名　　：研修
      *サブシステム名：受注
      *プログラム名　：受注チェックファイル作成
      *作成日／作成者：2026/06/03　ベンカルファララフマ
      *変更日／変更者：
      *変更内容　　　：
      ******************************************************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT 010-FILE ASSIGN TO ITF
           ORGANIZATION LINE SEQUENTIAL.

           SELECT 020-FILE ASSIGN TO OTF
           ORGANIZATION SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD 010-FILE.
       01 010-REC.
           COPY KJCF010.

       FD 020-FILE.
       01 020-REC.
           COPY KJCF020.
       
       WORKING-STORAGE SECTION.
       01 010-EOF PIC X(1) VALUE "N".
       01 010-CNT PIC 9(3) VALUE ZERO.

       PROCEDURE DIVISION.
       OPEN INPUT 010-FILE.
       OPEN OUTPUT 020-FILE.

           READ 010-FILE
             AT END MOVE "Y" TO 010-EOF
           END-READ.
 
           PERFORM UNTIL 010-EOF = "Y"
             MOVE SPACE TO 020-REC
             MOVE JF010-DATA-KBN TO JF020-DATA-KBN
             MOVE JF010-JUCHU-NO TO JF020-JUCHU-NO-X
             MOVE JF010-JUCHU-DATE TO JF020-JUCHU-DATE6
             MOVE JF010-SHOHIN-NO TO JF020-SHOHIN-NO-X
             MOVE JF010-SURYO-X TO JF020-SURYO-X
             MOVE 0 TO JF020-JUCHU-Y1
             MOVE SPACE TO JF020-ERR-KBN-TBL
             MOVE SPACE TO JF020-SHOHIN-MEI
             MOVE ZERO TO JF020-TANKA
             MOVE ZERO TO JF020-KINGAKU
             WRITE 020-REC
             ADD 1 TO 010-CNT
             READ 010-FILE
               AT END MOVE "Y" TO 010-EOF
             END-READ
           END-PERFORM.

           DISPLAY "COUNT:" 010-CNT.
           CLOSE 010-FILE.
           CLOSE 020-FILE.
           STOP RUN.
           