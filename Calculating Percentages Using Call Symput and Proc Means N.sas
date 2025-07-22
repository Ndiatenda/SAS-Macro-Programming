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

/* read data from sashelp lib class data set */
data class;
set sashelp.class;

/*Assignment - calculate correlations between variables*/
%let var_list = age weight;
%let var_list_2 = invoice engineSize;
%let database = class;
%let database_2 = cars;
proc means data=&database_2;
var &var_list_2;
output OUT=multi_stats(drop= _TYPE_ _FREQ_) mean= / autoname;
run;


%let dataset = &database;
%let var_list_3 = age weight height;

proc corr data=&dataset;
var &var_list_3;
run;

/* Intro to call symput function */
data _NULL_;
year =2018;
year_2 =2025;
call symput('name_year', year);
call symputx('name_year_2', year_2);
run;
%put the year is &name_year;

/* calculate average height and percentage above average */
data class;
set sashelp.class;
run;

/*now calculate average using proc means */
proc means data=class noprint;
var height;
output out=class_stats(drop= _TYPE_ _FREQ_) mean=avg N=total;
run;

/* define macro variables avg height and total students */
data _null_;
set class_stats;
call symputx('average_height', avg);
call symputx('total', total);
run;

/* create ind column for indicating above or below */
data class;
set class;
if height > &average_height then ind=1;
else ind=0;
run;

/*Add sort step before proc means*/
proc sort data=class;
    by ind;
run;

/* check how many above average and below */
proc means data=class noprint;
var ind;
by ind;
output out=tall_low(drop= _TYPE_ _FREQ_) N=Obs;
run;

/* now calculate percentage*/
data percent;
set tall_low;
percent = Obs/&total;
run;

