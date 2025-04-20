      IDENTIFICATION DIVISION.
     *
     *
     *
      PROGRAM-ID emppay.
      AUTHOR. John Braddock.
      
      ENVIRONMENT DIVISION.
      
      DATA DIVISION.
      WORKING-STORAGE SECTION.
          01  exit_sts      PIC 99.
      
      PROCEDURE DIVISION.
        main.
            DISPLAY "Running EMPPAY version 1.0"
            PERFORM INITIALIZATION
            STOP RUN
            .
      
      initialization.
            MOVE ZERO to exit_sts
            .
       *---------EOP-------
   
