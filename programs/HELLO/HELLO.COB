      *  1         2         3         4         5         6         7
      *890123456789012345678901234567890123456789012345678901234567890123
      * A  |                         B                                 |
      *------------------------------------------------------------------
      ******************************************
      * プログラム名 : HELLO2
      * 機能 : 名前を使ったメッセージを表示する
      ******************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO2.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 RAFUMA              PIC X(10) VALUE "RAFUMA".

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY "=============================".
           DISPLAY "HELLO, " RAFUMA "!".
           DISPLAY "=============================".
           STOP RUN.
           