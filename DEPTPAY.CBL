       IDENTIFICATION DIVISION.
      *MM
      *Summary
      *
       PROGRAM-ID deptpay.
       AUTHOR. John Braddock.
      
       ENVIRONMENT DIVISION.
      
       DATA DIVISION.
       WORKING-STORAGE SECTION.
          01  exit_sts             PIC 99.

          01  dept-record.
              03 dept-name         PIC X(20).
              03 dept-loc          PIC X(12).
              03  dept-manager.
                     05  manager_fname       PIC X(15).
                     05  manager_lname       PIC X(15).
              03  dept-nbr-emps              PIC 9(3).
              03  dept-total-salaries        PIC 9(7)V99.
              03  dept-avg-salary            PIC 9(7)V99.
      
       PROCEDURE DIVISION.
         main.
            DISPLAY "Running DEPTPAY version 1.0"
            PERFORM INITIALIZATION
            PERFORM average-salary
            PERFORM DISPLAY-DETAILS

            STOP RUN
            .
      
        initialization.
            MOVE ZERO to exit_sts
            .

         average-salary.
            MOVE "FINANCE"        TO dept-name
            MOVE "SOUTHWEST"      TO dept-loc
            MOVE "John"           TO manager-fname
            MOVE "Bonnechappe"    TO manager-lname
            MOVE 19               TO dept-nbr-emps
            MOVE 123.456          TO dept-total-salaries
            COMPUTE dept-avg-salary
                  = (dept-total-salaries / dept-nbr-emps)
            END-COMPUTE
            .

         display-details.
              DISPLAY "Dept NAme: " dept-name
              DISPLAY "Dept Locn: " dept-loc
              DISPLAY "Manager  : " manager-fname
            .
       *---------EOP-------
   
