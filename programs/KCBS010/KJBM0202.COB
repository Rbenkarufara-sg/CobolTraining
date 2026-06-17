       IDENTIFICATION DIVISION.
       PROGRAM-ID. KJBM0202.
      ******************************************************************
      * システム名    ：研修
      * サブシステム名：受注
      * プログラム名  ：受注データ形式チェック
      * 作成日／作成者：2026年6月4日　ベンカルファララフマ
      * 変更日／変更者：
      *       変更内容：
      ******************************************************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ITF-FILE ASSIGN TO ITF
             ORGANIZATION SEQUENTIAL.

           SELECT OTF-FILE ASSIGN TO OTF
             ORGANIZATION SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD ITF-FILE.
       01 ITF-REC.
         COPY KJCF020.

       FD OTF-FILE.
       01 OTF-REC.
         COPY KJCF020.

       WORKING-STORAGE SECTION.
       01 020-EOF PIC X(1) VALUE "N".
       01 ITF-CNT PIC 9(3) VALUE ZERO.
       01 OTF-CNT PIC 9(3) VALUE ZERO.
           COPY KCBS010P.

       PROCEDURE DIVISION.
      ******************************************************************
      * メインルーチン
      ******************************************************************
           PERFORM INIT-RTN
           PERFORM MAIN-RTN UNTIL 020-EOF = "Y"
           PERFORM END-RTN
           STOP RUN.
      ******************************************************************
      * 初期化
      ******************************************************************
       INIT-RTN SECTION.
           DISPLAY "*** KJBM020 START ***".
           OPEN INPUT ITF-FILE.
           OPEN OUTPUT OTF-FILE.
           PERFORM READ-RTN.
       EXT.
           EXIT.
      ******************************************************************
      * メイン処理
      ******************************************************************
       MAIN-RTN SECTION.
           MOVE ITF-REC TO OTF-REC.
           PERFORM CHECK-RTN.
           PERFORM WRITE-RTN.
           PERFORM READ-RTN.
       EXT.
           EXIT.
      ******************************************************************
      * チェック処理
      ******************************************************************
       CHECK-RTN SECTION.
           MOVE SPACE TO JF020-ERR-KBN-TBL OF OTF-FILE.
           MOVE JF020-JUCHU-DATE OF ITF-FILE TO S010-DATE
           CALL "KCBS010" USING KCBS010-P1.
           IF S010-RCD = "E"
             MOVE "1" TO JF020-ERR-KBN OF OTF-REC(3)
            ELSE 
             MOVE S010-DATE8 TO JF020-JUCHU-DATE OF OTF-FILE
           END-IF.
       EXT.
           EXIT.
      ******************************************************************
      * 正常終了処理
      ******************************************************************
       END-RTN SECTION.
           DISPLAY "ITF-CNT:" ITF-CNT.
           DISPLAY "OTF-CNT:" OTF-CNT.
           CLOSE ITF-FILE.
           CLOSE OTF-FILE.
           DISPLAY "*** KJBM020 END ***".
       EXT.
           EXIT.
      ******************************************************************
      * 読み取り処理
      ******************************************************************
       READ-RTN SECTION.
           READ ITF-FILE
             AT END 
               MOVE "Y" TO 020-EOF
             NOT AT END 
               ADD 1 TO ITF-CNT
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
