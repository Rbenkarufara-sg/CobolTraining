       IDENTIFICATION DIVISION.
       PROGRAM-ID. KUBM020.
      ******************************************************************
      * システム名    ：研修
      * サブシステム名：売上
      * プログラム名  ：売上集計
      * 作成日／作成者：2026年6月8日　ベンカルファララフマ
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
           COPY KUCF010.

       FD OTF-FILE.
       01 OTF-REC.
           COPY KUCF020.

       WORKING-STORAGE SECTION.
       01 KUBM-EOF PIC X(1) VALUE "N".
       01 WK-KUCF.
           03 WK-SHOHIN-NO PIC X(5) VALUE LOW-VALUE.
           03 WK-JUCHU-YY  PIC X(4) VALUE LOW-VALUE.
           03 WK-JUCHU-MM  PIC X(2) VALUE LOW-VALUE.
       01 WK-TOTAL PIC S9(9) VALUE ZERO.
       01 ITF-CNT  PIC 9(3) VALUE ZERO.
       01 OTF-CNT  PIC 9(3) VALUE ZERO.

       PROCEDURE DIVISION.
      ******************************************************************
      * メインルーチン
      ******************************************************************
           PERFORM INIT-RTN.
           PERFORM MAIN-RTN UNTIL KUBM-EOF = "Y".
           PERFORM END-RTN.
           STOP RUN.
      ******************************************************************
      * 初期化
      ******************************************************************
       INIT-RTN SECTION.
           DISPLAY "*** KUBM020 START ***".
           OPEN INPUT ITF-FILE.
           OPEN OUTPUT OTF-FILE.
           PERFORM READ-RTN.
       EXT.
           EXIT.
      ******************************************************************
      * メイン処理（集計処理）
      ******************************************************************
       MAIN-RTN SECTION.
           IF (UF010-JUCHU-YY = WK-JUCHU-YY
              AND UF010-JUCHU-MM = WK-JUCHU-MM) 
              AND UF010-SHOHIN-NO = WK-SHOHIN-NO
             IF UF010-DATA-KBN = "1"
               COMPUTE WK-TOTAL = WK-TOTAL + UF010-KINGAKU
             ELSE
               IF UF010-DATA-KBN = "9"
                 COMPUTE WK-TOTAL = WK-TOTAL - UF010-KINGAKU
               END-IF
             END-IF
             PERFORM READ-RTN
           ELSE 
             IF WK-KUCF NOT = LOW-VALUE
               MOVE SPACE TO OTF-REC
               MOVE WK-TOTAL TO UF020-KINGAKU
               MOVE WK-JUCHU-YY TO UF020-JUCHU-YY
               MOVE WK-JUCHU-MM TO UF020-JUCHU-MM
               MOVE WK-SHOHIN-NO TO UF020-SHOHIN-NO
               PERFORM WRITE-RTN
             END-IF
             MOVE UF010-JUCHU-YY TO WK-JUCHU-YY
             MOVE UF010-JUCHU-MM TO WK-JUCHU-MM
             MOVE UF010-SHOHIN-NO TO WK-SHOHIN-NO
             MOVE ZERO TO WK-TOTAL
           END-IF.
       EXT.
           EXIT.
      ******************************************************************
      * 終了処理
      ******************************************************************
       END-RTN SECTION.
           IF WK-KUCF NOT = LOW-VALUE
             MOVE SPACE TO OTF-REC
             MOVE WK-TOTAL TO UF020-KINGAKU
             MOVE WK-JUCHU-YY TO UF020-JUCHU-YY
             MOVE WK-JUCHU-MM TO UF020-JUCHU-MM
             MOVE WK-SHOHIN-NO TO UF020-SHOHIN-NO
             PERFORM WRITE-RTN
           END-IF.
           DISPLAY "ITF-CNT:" ITF-CNT.
           DISPLAY "OTF-CNT:" OTF-CNT.
           CLOSE ITF-FILE.
           CLOSE OTF-FILE.
           DISPLAY "*** KUBM020 END ***".
       EXT.
           EXIT.
      ******************************************************************
      * 読み取り処理
      ******************************************************************
       READ-RTN SECTION.
           READ ITF-FILE
             AT END
               MOVE "Y" TO KUBM-EOF
             NOT AT END
               ADD 1 TO ITF-CNT
           END-READ.
       EXT.
           EXIT.
      ******************************************************************
      * 書き込み処理
      ******************************************************************
       WRITE-RTN SECTION.
           WRITE OTF-REC.
           ADD 1 TO OTF-CNT.
       EXT.
           EXIT.
      