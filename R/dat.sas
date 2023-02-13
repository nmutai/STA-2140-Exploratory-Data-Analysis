* Written by R;
*  write.foreign(dat, "dat.txt", "dat.sas", package = "SAS") ;

DATA  rdata ;
INFILE  "dat.txt" 
     DSD 
     LRECL= 23 ;
INPUT
 Ozone
 Solar_R
 Wind
 Temp
 Month
 Day
;
LABEL  Solar_R = "Solar.R" ;
RUN;
