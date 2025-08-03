/* Part 1: Macro to extract date */
%macro extract_date(str);
    %local rc pos len date;
    data _null_;
        length input_str $200 date $10;
        input_str = "&str";
        retain date '';
        re = prxparse('/\d{2}\/\d{2}\/\d{4}/');
        call prxsubstr(re, input_str, pos, len);
        if pos > 0 then date = substr(input_str, pos, len);
        call symputx('extracted_date', date);
        stop;
    run;

    %put Extracted date: &extracted_date;
%mend extract_date;

/* Test the macro */
%extract_date(My birthday was on 01/01/2018);
%extract_date(Today is my birthday 03/12/2018);


/* Part 2: Arithmetic examples */
%let number1=10;
%let number2=3;

%put Division: %sysevalf(&number1 / &number2);
%put Power: %sysevalf(&number1 ** &number2);
%put Addition: %eval(&number1 + &number2);
%put Multiplication: %eval(&number1 * &number2);


/* Part 3: Printing literal string with macro variables */
%put I created two macro variable &&date and &&time;
