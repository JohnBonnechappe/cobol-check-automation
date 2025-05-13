//DEPTPAYJ JOB 1,NOTIFY=&SYSUID,TIME=(1,0)
//*COPY2DS1 EXEC PGM=IKJEFT01
//*INUNIX DD PATHOPTS=(ORDONLY),
//* PATH='/z/&SYSUID./cobolcheck/CC##99.CBL'
//*OUTMVS DD DSN=&SYSUID..CBL(DEPTPAY),DISP=SHR
//*SYSTSPRT DD *
//*  0COPY IND(INUNIX) OUTDD(OUTMVS) TEXT CONVERT(YES) PATHOPTS(USE)
//********************************************************
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(DEPTPAY),DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(DEPTPAY),DISP=SHR
//********************************************************
// IF RC = 0 THEN
//********************************************************
//RUN    EXEC PGM=DEPTPAY
//STEPLIB  DD DSN=&SYSUID..LOAD,DISP=SHR
//ACCTREC  DD DSN=&SYSUID..DATA,DISP=SHR
//PRTLINE  DD SYSOUT=*,OUTLIM=15000
//SYSOUT   DD SYSOUT=*,OUTLIM=15000
//CEEDUMP  DD DUMMY
//SYSUDUMP DD DUMMY
//*********************************************************
// ELSE
// ENDIF
//*
