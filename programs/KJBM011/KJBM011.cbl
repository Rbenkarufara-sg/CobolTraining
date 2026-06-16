       IDENTIFICATION DIVISION.
       PROGRAM-ID. KJBM011.
      ******************************************************************
      * システム名    ：研修
      * サブシステム名：受注
      * プログラム名  ：受注チェックファイル作成（DB入力版）
      * 作成日／作成者：2026年6月12日　ベンカルファララフマ
      * 変更日／変更者：
      *       変更内容：
      ******************************************************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OTF-FILE ASSIGN TO OTF
            ORGANIZATION SEQUENTIAL.
       
       DATA DIVISION.
       FILE SECTION.
       FD OTF-FILE.
       01 OTF-REC.
           COPY KJCF020.
       
       WORKING-STORAGE SECTION.
       01 OTF-CNT PIC 9(3) VALUE ZERO.
       01 FETCH-CNT PIC 9(3) VALUE ZERO.
       01 FETCH-EOF PIC X(1) VALUE "N".

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01 DSN PIC X(256).
       01 H-KCCMJUCHU.
           EXEC SQL INCLUDE KCCMJUCHU END-EXEC.
       EXEC SQL DECLARE JUCHU-CUR CURSOR FOR 
           SELECT * 
           FROM KCCMJUCHU 
       END-EXEC.
       EXEC SQL END DECLARE SECTION END-EXEC.
       EXEC SQL INCLUDE SQLCA END-EXEC.

       PROCEDURE DIVISION.
      ******************************************************************
      * メインルーチン
      ******************************************************************
           PERFORM INIT-RTN.
           PERFORM MAIN-RTN UNTIL FETCH-EOF = "Y".
           PERFORM SUCCESSFUL-END-RTN.
           STOP RUN.
      ******************************************************************
      * 初期処理
      ******************************************************************
       INIT-RTN SECTION.
           DISPLAY "*** KJBM011 START ***".
           OPEN OUTPUT OTF-FILE.
           PERFORM CONNECT-RTN.
           PERFORM FETCH-RTN.
       EXT.
           EXIT.
      ******************************************************************
      * 接続処理
      ******************************************************************
       CONNECT-RTN SECTION.
           STRING
             "DRIVER={Postgresql Unicode};" 
             "SERVER=DB;"
             "DBQ=postgres;"
             "UID=postgres;"
             "PWD=postgres;"
             "CONNSETTINGS=SET CLIENT_ENCODING to 'SJIS';"
             INTO DSN
           END-STRING.
           EXEC SQL CONNECT :DSN END-EXEC.
           IF SQLCODE NOT = ZERO
             PERFORM ERROR-RTN
           END-IF.
           EXEC SQL OPEN JUCHU-CUR END-EXEC.
       EXT.
           EXIT.
      ******************************************************************
      * 読み取り処理（レコードを１行ずつ）
      ******************************************************************
       FETCH-RTN SECTION.
           EXEC SQL FETCH JUCHU-CUR
           INTO :CMJUCHU-DATA-KBN,
                :CMJUCHU-JUCHU-NO,
                :CMJUCHU-JUCHU-DATE,
                :CMJUCHU-SHOHIN-NO,
                :CMJUCHU-SURYO
           END-EXEC.

           EVALUATE SQLCODE
             WHEN 0
               ADD 1 TO FETCH-CNT
             WHEN 100
               MOVE "Y" TO FETCH-EOF
             WHEN OTHER
               PERFORM ERROR-RTN
             END-EVALUATE.
       EXT.
           EXIT.
      ******************************************************************
      * メイン処理
      ******************************************************************
       MAIN-RTN SECTION.
           MOVE SPACE TO OTF-REC.
           MOVE CMJUCHU-DATA-KBN TO JF020-DATA-KBN.
           MOVE CMJUCHU-JUCHU-NO TO JF020-JUCHU-NO-X.
           MOVE ZERO TO JF020-JUCHU-Y1.
           MOVE CMJUCHU-JUCHU-DATE TO JF020-JUCHU-DATE6.
           MOVE CMJUCHU-SHOHIN-NO TO JF020-SHOHIN-NO-X.
           MOVE CMJUCHU-SURYO TO JF020-SURYO-X.
           MOVE SPACE TO JF020-ERR-KBN-TBL.
           MOVE SPACE TO JF020-SHOHIN-MEI.
           MOVE ZERO TO JF020-TANKA.
           MOVE ZERO TO JF020-KINGAKU.
           
           PERFORM WRITE-RTN.
       EXT.
           EXIT.
      ******************************************************************
      * 書き込み処理
      ******************************************************************
       WRITE-RTN SECTION.
           WRITE OTF-REC.
           ADD 1 TO OTF-CNT.
           PERFORM FETCH-RTN.
       EXT.
           EXIT.
      ******************************************************************
      * 通常終了処理
      ******************************************************************
       SUCCESSFUL-END-RTN SECTION.
           EXEC SQL COMMIT END-EXEC.
           PERFORM END-RTN.
       EXT.
           EXIT.
      ******************************************************************
      * エラー終了処理
      ******************************************************************
       ERROR-RTN SECTION.
           EXEC SQL ROLLBACK END-EXEC.
           DISPLAY "!!! FETCHDB ABEND : DATABASE ACCESS ERROR !!!".
           DISPLAY "SQLCODE:" SQLCODE.
           DISPLAY "SQLERRMC:" SQLERRMC.
           MOVE "9" TO RETURN-CODE.
           PERFORM END-RTN.
       EXT.
           EXIT.
      ******************************************************************
      * 共通終了処理
      ******************************************************************
       END-RTN SECTION.     
           EXEC SQL CLOSE JUCHU-CUR END-EXEC.
           EXEC SQL DISCONNECT ALL END-EXEC.
           CLOSE OTF-FILE.
           DISPLAY "FETCH-CNT:" FETCH-CNT.
           DISPLAY "OTF-CNT:" OTF-CNT.
           DISPLAY "*** KJBM011 END ***".
       EXT.
           EXIT.
     