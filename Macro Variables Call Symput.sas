/* Assignment 3 - macro variables call symput */

/* Step 1: Load the dataset */
data cars;
set sashelp.cars;
run;

/* Step 2: calculate total cars and total per make */
proc means data=cars noprint nway;
    class Make;
    output out=make_counts (drop=_TYPE_ _FREQ_) n=vehicle_count;
run;

/* Step 3: Use PROC MEANS again to get total vehicle count */
proc means data=cars noprint;
    output out=total_vehicles (drop=_TYPE_ _FREQ_) n=total;
run;

/* Step 4: Calculate proportion */
data result;
    if _N_ = 1 then set total_vehicles;
    set make_counts;
    prct = vehicle_count / total;
    keep Make prct;
run;


/* Step 5: Display final result */
proc print data=result noobs;
run;