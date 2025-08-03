%let one=two;
%let two=three;
%let three=four;

/* 1. Direct four*/
%put &three;

/* 2. One level indirect */
%put &&&two;

/* 3. Two levels indirect */
%put &&&&&one;
