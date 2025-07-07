/* define some macro variables*/
%let name = Alfred;
%let sex = M;

/* read data from sashelp class lib */
data class;
set sashelp.class;
run;

/* calc mean age */
proc means data=class;
var age;
output mean=avg;
run;
