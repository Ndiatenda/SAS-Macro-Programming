/* Step 1: Read class dataset and count number of boys and girls */
data _null_;
    set sashelp.class end=last;
    retain boys girls 0;

    if sex = 'M' then boys + 1;
    else if sex = 'F' then girls + 1;

    if last then do;
        call symputx('boys', boys);
        call symputx('girls', girls);
        put "In the class there are " boys " boys and " girls " girls.";
    end;
run;


/* Step 2: Create macro variables name1 to name19 from the dataset */
data _null_;
    set sashelp.class;
    call symputx(cats('name', _N_), name);
run;

/*test*/
%put &name1;
