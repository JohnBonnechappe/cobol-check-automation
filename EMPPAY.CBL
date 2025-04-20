       IDENTIFICATION DIVISION.
      ************************************************
      *  Program ID:   EMPPAY
      *  Program name: Calculate employee pay.
      *  Summary:      Calculate pay taking into account overtime.
      ************************************************
      *
       PROGRAM-ID. EMPPAY.
       AUTHOR. John Braddock
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 rec-counter           PIC 9(4).

       01 emp-record.
          03 emp-name.
             05 emp-fname       PIC  X(15).
             05 emp-lname       PIC  X(15).
          03 emp-hourly-rate    PIC  9(3)V99.
          03 emp-ot-rate        PIC  V99.   
          03 emp-reward         PIC  V99.
          03 emp-hours          PIC  9(3).
          03 emp-pay-week       PIC  9(7)V99.
          03 emp-pay-month      PIC  9(7)V99.

       PROCEDURE DIVISION.
         main.
           DISPLAY "In EMPPAY Version 1.0"

           PERFORM initialization
           PERFORM payment-weekly
           PERFORM payment-monthly
           PERFORM show-output

           STOP RUN
           .
       initialization.
           MOVE  "John"        TO  emp-fname
           MOVE  "Bonnechappe" TO  emp-lname
           MOVE  19            TO  emp-hours
           MOVE  23.5          TO  emp-hourly-rate
           .
       payment-weekly.
           IF emp-hours >= 40
             MOVE 0.25 TO emp-ot-rate
           ELSE IF emp-hours >= 50
             MOVE 0.50 TO emp-ot-rate
           ELSE
             MOVE ZERO TO emp-ot-rate
           END-IF

           COMPUTE emp-pay-week
                = (emp-hours * emp-hourly-rate) * (1 + emp-ot-rate)
           END-COMPUTE
           .

       payment-monthly.
           IF emp-hours > 150
             MOVE 0.50 TO emp-reward
           ELSE
             MOVE ZERO TO emp-reward
           END-IF

           COMPUTE emp-pay-month
                 =   (emp-pay-week * 4) * (1 + emp-reward)
           END-COMPUTE
           .

       show-output.
           DISPLAY  "Name               :" emp-name
           DISPLAY  "Hours Worked       :" emp-hours
           DISPLAY  "Hourly rate        :" emp-hourly-rate
           DISPLAY  "OT rate            :" emp-ot-rate
           DISPLAY  "Gross pay per week :" emp-pay-week
           DISPLAY  "Gross pay per month:" emp-pay-month
           DISPLAY  "Hi World"
           .
      *-----------EOP-----------
