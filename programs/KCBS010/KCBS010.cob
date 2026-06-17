       IDENTIFICATION DIVISION.
       PROGRAM-ID. KCBS010.
      ******************************************************************
      *システム名　　：研修
      *サブシステム名：共通
      *プログラム名　：日付チェック
      *作成日／作成者：2026/06/16　ベンカルファララフマ
      *変更日／変更者：
      *変更内容　　　：
      ******************************************************************
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WK-AREA.
           03 WK-DD      PIC 9(2).
           03 LEAP-Y     PIC X(1).
           03 LEAP-SHO   PIC S9(5) COMP-3.
           03 LEAP-AMARI PIC S9(5) COMP-3.

       LINKAGE SECTION.
           COPY KCBS010P.

       PROCEDURE DIVISION USING KCBS010-P1.
           MOVE SPACE TO S010-RCD.

           PERFORM INPUT-CHK-RTN
           IF (S010-RCD = SPACE)
             IF (S010-P1-Y1 = ZERO)
               PERFORM DATE8-RTN
             END-IF
             IF (S010-D6-MM = 2) AND (S010-D8-DD = 29)
               PERFORM LEAP-CHK-RTN
             END-IF
           END-IF.

           EXIT PROGRAM.
      ******************************************************************
      * 入力チェック
      ******************************************************************
       INPUT-CHK-RTN SECTION.
           IF S010-DATE NOT NUMERIC
             MOVE "E" TO S010-RCD
             GO TO EXT
           END-IF.
           
           IF (S010-D6-MM < 1) OR (S010-D6-MM > 12)
             MOVE "E" TO S010-RCD
             GO TO EXT
           END-IF.
           
           EVALUATE TRUE
              WHEN S010-D6-MM = 2
                MOVE 29 TO WK-DD
              WHEN S010-D6-MM = 4 OR 6 OR 9 OR 11
                MOVE 30 TO WK-DD
              WHEN OTHER
                MOVE 31 TO WK-DD
           END-EVALUATE.

           IF S010-D6-DD < 1 OR S010-D6-DD > WK-DD
             MOVE "E" TO S010-RCD
             GO TO EXT
           END-IF.
       EXT.
           EXIT.
      ******************************************************************
      * 西暦日付８桁へ変換
      ******************************************************************
       DATE8-RTN SECTION.
           IF S010-P1-Y1 = ZERO
             IF S010-D6-Y2 < 90
               MOVE 20 TO S010-P1-Y1
             ELSE
               IF S010-D6-Y2 >= 90
                 MOVE 19 TO S010-P1-Y1
               END-IF
             END-IF
           END-IF.
       EXT.
           EXIT.
      ******************************************************************
      * 閏年チェック
      ******************************************************************
       LEAP-CHK-RTN SECTION.
           MOVE "N" TO LEAP-Y.
           DIVIDE S010-D8-YY BY 400 
            GIVING LEAP-SHO REMAINDER LEAP-AMARI.
           
           IF LEAP-AMARI = 0
             MOVE "Y" TO LEAP-Y
           ELSE
             DIVIDE S010-D8-YY BY 100 
              GIVING LEAP-SHO REMAINDER LEAP-AMARI
             IF LEAP-AMARI NOT = 0
               DIVIDE S010-D8-YY BY 4
                GIVING LEAP-SHO REMAINDER LEAP-AMARI
               IF LEAP-AMARI = 0
                 MOVE "Y" TO LEAP-Y
               END-IF
             END-IF
           END-IF.

           IF LEAP-Y = "N"
             MOVE "E" TO S010-RCD
           END-IF.
       EXT.
           EXIT.

             


              