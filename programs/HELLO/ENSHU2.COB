      *  1         2         3         4         5         6         7
      *890123456789012345678901234567890123456789012345678901234567890123
      * A  |                         B                                 |
      *------------------------------------------------------------------
      ******************************************
      * プログラム名 : ENSHU2
      * 機能 : VALUE句と図形定数
      ******************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENSHU2.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WK-LINE     PIC X(50) VALUE ALL "-".
       01 WK-COUNT    PIC 9(5) VALUE ZERO.
       01 WK-HEADER   PIC X(30) VALUE SPACE.
       01 WK-END-MARK PIC X(10) VALUE HIGH-VALUE.
