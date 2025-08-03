/* Referencing macro variables indirectly */

/* example 1 */
%let city1=NewYork;
%let name=city;
%let index=1;

/* indirectly call NewYork */
%put &&&name.&index;
/* basic rules:
1. processed from left to right
2. multiple ampersands, re-scan run until none left
3. two ampersands result into one during resolution
*/

/* example 2 */
%let a=b;
%let b=c;
%let c=d;

/* direct way to get b*/
%put &a;

/* indirect c*/
%put &&&a;

/* indirect d */
%put &&&b;

