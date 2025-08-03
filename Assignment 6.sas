/* Step 1: Define macro variables */
%let path = /home/u64269108;
%let file = cars.xlsx;
%let sheet = carlist; /* Update if actual sheet name is different */

/* Step 2: Read the Excel file using PROC IMPORT */
proc import datafile="&path/&file"
    out=cars_data
    dbms=xlsx
    replace;
    sheet="&sheet";
    getnames=yes;
run;

