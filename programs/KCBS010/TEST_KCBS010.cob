       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST_KCBM010.
      ******************************************************************
      * システム名    ：研修
      * サブシステム名：受注
      * プログラム名  ：受注データ形式チェック
      * 作成日／作成者：2026年6月4日　ベンカルファララフマ
      * 変更日／変更者：
      *       変更内容：
      ******************************************************************
       ENVIRONMENT DIVISION.
      
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           COPY KCBS010P.

       PROCEDURE DIVISION.
           MOVE "00240229" TO S010-DATE.
           CALL "KCBS010" USING KCBS010-P1.
           DISPLAY  "DATE:" S010-DATE8 " RETURN-CODE:" S010-RCD.

           MOVE "00260501" TO S010-DATE.
           CALL "KCBS010" USING KCBS010-P1.
           DISPLAY "DATE:" S010-DATE8 " RETURN-CODE:" S010-RCD.

           MOVE "00960413" TO S010-DATE.
           CALL "KCBS010" USING KCBS010-P1.
           DISPLAY "DATE:" S010-DATE8 " RETURN-CODE:" S010-RCD.

           MOVE "00261307" TO S010-DATE.
           CALL "KCBS010" USING KCBS010-P1.
           DISPLAY "DATE:" S010-DATE8 " RETURN-CODE:" S010-RCD.

           MOVE "00230931" TO S010-DATE.
           CALL "KCBS010" USING KCBS010-P1.
           DISPLAY "DATE:" S010-DATE8 " RETURN-CODE:" S010-RCD.

           MOVE "00230229" TO S010-DATE.
           CALL "KCBS010" USING KCBS010-P1.
           DISPLAY "DATE:" S010-DATE8 " RETURN-CODE:" S010-RCD.

           MOVE "002302AA" TO S010-DATE.
           CALL "KCBS010" USING KCBS010-P1.
           DISPLAY "DATE:" S010-DATE8 " RETURN-CODE:" S010-RCD.

           STOP RUN.
