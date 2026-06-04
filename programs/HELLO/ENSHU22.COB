      *  1         2         3         4         5         6         7
      *890123456789012345678901234567890123456789012345678901234567890123
      * A  |                         B                                 |
      *------------------------------------------------------------------
      ******************************************
      * ÉvÉçÉOÉâÉÄñº : ENSHU22
      * ã@î\ : éZèpââéZéq
      ******************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENSHU22.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WK-PRICE PIC 9(4) VALUE 1500.
       01 WK-QTY   PIC 9(2) VALUE 25.
       01 SUBTOTAL PIC 9(8) VALUE ZERO.
       01 TAX      PIC 9(8) VALUE ZERO.
       01 TOTAL    PIC 9(8) VALUE ZERO.

       PROCEDURE DIVISION.
           COMPUTE SUBTOTAL = WK-PRICE * WK-QTY.
           COMPUTE TAX = SUBTOTAL * 0.10.
           COMPUTE TOTAL = SUBTOTAL + TAX.

           DISPLAY "SUBTOTAL:" SUBTOTAL.
           DISPLAY "TAX:" TAX.
           DISPLAY "TOTAL:" TOTAL.
       
