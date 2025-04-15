IDENTIFICATION DIVISION.
  AUTHOR: John Braddock
ENVIRONMENT DIVISION.
DATA DIVISION.
WORKING-STORAGE SECTION.
PROCEDURE DIVISION.
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
ELSE
END-IF

  .
show-output.
END-
  .


  
