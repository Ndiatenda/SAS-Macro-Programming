/* define some macro variables*/
%let weight = WEIGHT;
%let age = AGE;

/* read data from sashelp class lib */
data class;
set sashelp.class;
run;

/* calc mean age and weight*/
%let var=weight age;
proc means data=class;
var &var;
output OUT=average_age(drop=_TYPE_ _FREQ_) mean= / autoname;
run;