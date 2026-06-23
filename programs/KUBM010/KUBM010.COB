       IDENTIFICATION              DIVISION.
       PROGRAM-ID.                 KUBM010.
      ********************************************************
      * システム名    ：研修
      * サブシステム名：売上
      * プログラム名  ：売上ファイル作成【作成例】
      * 作成日／作成者：２０２６年３月３０日  システム技研
      * 変更日／変更者：
      *       変更内容：
      ********************************************************
       ENVIRONMENT                 DIVISION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.
           SELECT  ITF-FILE  ASSIGN TO  EXTERNAL  ITF.
           SELECT  OTF-FILE  ASSIGN TO  EXTERNAL  OTF.
      *
       DATA                        DIVISION.
       FILE                        SECTION.
       FD  ITF-FILE.
       01  ITF-REC.
           COPY  KJCF020.
       FD  OTF-FILE.
       01  OTF-REC.
           COPY  KUCF010.
      *
       WORKING-STORAGE             SECTION.
       01  ITF-CNT                 PIC  S9(9)  COMP-3  VALUE  +0.
       01  OTF-CNT                 PIC  S9(9)  COMP-3  VALUE  +0.
       01  ITF-END-FLG             PIC   X(1)          VALUE  "0".
      *
      ********************************************************
      *    売上ファイル作成
      ********************************************************
       PROCEDURE                   DIVISION.
           PERFORM  INIT-RTN.
           PERFORM  MAIN-RTN  UNTIL  ITF-END-FLG  =  "1".
           PERFORM  TERM-RTN.
           STOP  RUN.
      ********************************************************
      * 開始処理
      ********************************************************
       INIT-RTN                    SECTION.
           DISPLAY  "*** KUBM010 START ***".
           OPEN  INPUT   ITF-FILE.
           OPEN  OUTPUT  OTF-FILE.
           PERFORM  READ-RTN.
       EXT.
           EXIT.
      ********************************************************
      * 入力処理
      ********************************************************
       READ-RTN                    SECTION.
           READ  ITF-FILE
             AT  END  
               MOVE  "1"  TO  ITF-END-FLG
             NOT  AT  END
               ADD  +1    TO  ITF-CNT
           END-READ.
       EXT.
           EXIT.
      ********************************************************
      * 編集処理
      ********************************************************
       MAIN-RTN                    SECTION.
           MOVE  SPACE             TO  OTF-REC.
           MOVE  JF020-DATA-KBN    TO  UF010-DATA-KBN.
           MOVE  JF020-JUCHU-DATE  TO  UF010-JUCHU-DATE.
           MOVE  JF020-JUCHU-NO    TO  UF010-JUCHU-NO.
           MOVE  JF020-SHOHIN-NO   TO  UF010-SHOHIN-NO.
           MOVE  JF020-SHOHIN-MEI  TO  UF010-SHOHIN-MEI.
           MOVE  JF020-TANKA       TO  UF010-TANKA.
           MOVE  JF020-SURYO       TO  UF010-SURYO.
           MOVE  JF020-KINGAKU     TO  UF010-KINGAKU.
           PERFORM  WRITE-RTN.
           PERFORM  READ-RTN.
       EXT.
           EXIT.
      ********************************************************
      * 出力処理
      ********************************************************
       WRITE-RTN                  SECTION.
           WRITE  OTF-REC.
           ADD  +1  TO  OTF-CNT.
       EXT.
           EXIT.
      ********************************************************
      * 終了処理
      ********************************************************
       TERM-RTN                   SECTION.
           CLOSE  ITF-FILE  OTF-FILE.
           DISPLAY  "*** ITF-CNT ="  ITF-CNT.
           DISPLAY  "*** OTF-CNT ="  OTF-CNT.
           DISPLAY  "*** KUBM010  END  ***".
       EXT.
           EXIT.
