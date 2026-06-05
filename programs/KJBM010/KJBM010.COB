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
           SELECT ITF-FILE ASSIGN TO ITF
           ORGANIZATION LINE SEQUENTIAL.

           SELECT OTF-FILE ASSIGN TO OTF
           ORGANIZATION SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD ITF-FILE.
       01 ITF-REC.
           COPY KJCF010.

       FD OTF-FILE.
       01 OTF-REC.
           COPY KJCF020.
       
       WORKING-STORAGE SECTION.
       01 010-EOF PIC X(1) VALUE "N".
       01 ITF-CNT PIC 9(3) VALUE ZERO.
       01 OTF-CNT PIC 9(3) VALUE ZERO.

       PROCEDURE DIVISION.
      ******************************************************************
      * メインルーチン
      ******************************************************************
           PERFORM INIT-RTN.
           PERFORM MAIN-RTN UNTIL 010-EOF = "Y".
           PERFORM NORM-END-RTN.
           STOP RUN.
      ******************************************************************
      * 初期化
      ******************************************************************
       INIT-RTN SECTION.
           DISPLAY "*** KJBM010 START ***"
           OPEN INPUT ITF-FILE.
           OPEN OUTPUT OTF-FILE.
           PERFORM READ-RTN.
       EXT.
           EXIT.
      ******************************************************************
      * 繰り返し処理
      ******************************************************************
       MAIN-RTN SECTION.
           MOVE SPACE TO OTF-REC.
           MOVE JF010-DATA-KBN TO JF020-DATA-KBN
           MOVE JF010-JUCHU-NO-X TO JF020-JUCHU-NO-X
           MOVE JF010-JUCHU-DATE TO JF020-JUCHU-DATE6
           MOVE JF010-SHOHIN-NO TO JF020-SHOHIN-NO-X
           MOVE JF010-SURYO-X TO JF020-SURYO-X
           MOVE 0 TO JF020-JUCHU-Y1
           MOVE SPACE TO JF020-ERR-KBN-TBL
           MOVE SPACE TO JF020-SHOHIN-MEI
           MOVE ZERO TO JF020-TANKA
           MOVE ZERO TO JF020-KINGAKU
           PERFORM WRITE-RTN.
           PERFORM READ-RTN.
       EXT.
           EXIT.
      ******************************************************************
      * 正常終了処理
      ******************************************************************
       NORM-END-RTN SECTION.
           DISPLAY "ITF-CNT:" ITF-CNT.
           DISPLAY "OTF-CNT:" OTF-CNT.
           CLOSE ITF-FILE.
           CLOSE OTF-FILE.
           DISPLAY "*** KJBM010 END ***"
       EXT.
           EXIT.
      ******************************************************************
      * 読み取り処理
      ******************************************************************
       READ-RTN SECTION.
           READ ITF-FILE
             AT END MOVE "Y" TO 010-EOF
             NOT AT END ADD 1 TO ITF-CNT
           END-READ.
       EXT.
           EXIT.
      ******************************************************************
      * 書き込み処理
      ******************************************************************
       WRITE-RTN SECTION.
           WRITE OTF-REC
           ADD 1 TO OTF-CNT.
       EXT.
           EXIT.
      
