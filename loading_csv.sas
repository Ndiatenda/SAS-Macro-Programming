/* Generated Code (IMPORT) */
/* Source File: Class.csv */
/* Source Path: /home/u64269108 */
/* Code generated on: 7/29/25, 8:54 PM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/home/u64269108/Class.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;