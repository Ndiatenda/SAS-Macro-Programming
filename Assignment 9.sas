/*Questions for this assignment
Please create a general macro, that reads any dataset from 
Sashelp library, calculate average for specific list of
 variables and prints the result.
*/

%macro avg_macro(dataset_name=, varlist=);

    /* Calculate means */
    proc means data=sashelp.&dataset_name noprint;
        var &varlist;
        output out=avg_results mean=;
    run;

    /* Print the calculated averages */
    proc print data=avg_results label noobs;
        title "Average values for variables: &varlist in dataset &dataset_name";
    run;

%mend;

/* Test */
%avg_macro(dataset_name=cars, varlist=Invoice EngineSize Horsepower);

%avg_macro(dataset_name=heart, varlist=AgeAtStart Height Weight);



