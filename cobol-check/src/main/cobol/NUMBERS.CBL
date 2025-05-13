       IDENTIFICATION DIVISION.
       PROGRAM-ID. numbers.
       AUTHOR. John Braddock.
      
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
      
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
          01  exit_sts             PIC 99.

          01  FILLER.
              03  ws-field-0       PIC S9(11)V9(07) COMP-3.
              03  ws-field-1       PIC S9(11)V9(07) COMP-3.
              03  ws-field-2       PIC S9(16) COMP.
              03  ws-field-3       PIC S9(16) COMP-4.
              03  ws-display-field PIC S9(5)V99.
              03  ws-num-occ       PIC 9(04) OCCURS 10.

          77 char-ct               PIC S9(3) COMP.

       PROCEDURE DIVISION.
         main.
            DISPLAY "Running Numbers vers 1.01"
            STOP RUN
            .
