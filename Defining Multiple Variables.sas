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

/* using put statement to print, for debugging */
%put Hello World!;
/* can also print variable value */
%put The variables are: &var;

/* defining multiple macro variables */

/* read data from sashelp cars lib */
data cars;
set sashelp.cars;
run;

%let var_list = age weight;
%let var_list_2 = invoice engineSize;
%let database = class;
%let database_2 = cars;
proc means data=&database_2;
var &var_list_2;
output OUT=multi_stats(drop= _TYPE_ _FREQ_) mean= / autoname;
run;
