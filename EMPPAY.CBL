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
  IF emp-hours > 
  ELSE
 IF
""
  .
payment-monthly.
  .
show-output.
  .


  
