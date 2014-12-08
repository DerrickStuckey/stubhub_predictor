libname Nba "C:\Users\Benyamin\Documents\My SAS Files\9.3\Nba";
/*classifying in high*/
data high_class;
set Nba.Prices3;
if (section_lmh= "Hig") then output high_class;
run;

/* this part finds the first and the last observation */
proc sort data=high_class;
by event_id section_lmh descending days_out;
run;
data high_class;
set high_class;
by event_id section_lmh descending days_out;
if first.event_id then closing_price=overall_avg_price;
if last.event_id then opening_price=overall_avg_price;
run;
/*classifying medium prices*/
data med_class;
set Nba.Prices3;
if (section_lmh= "Med") then output med_class;
run;
/* finds the first and the last observation in med class*/
proc sort data=med_class;
by event_id section_lmh descending days_out;
run;
data med_class;
set med_class;
by event_id section_lmh descending days_out;
if first.event_id then closing_price=overall_avg_price;
if last.event_id then opening_price=overall_avg_price;
run;
/*classifying in low prices*/
data low_class;
set Nba.Prices3;
if (section_lmh= "Low") then output low_class;
run;
/*finds the firstand last observation in the low class*/
proc sort data=low_class;
by event_id section_lmh descending days_out;
run;
data low_class;
set low_class;
by event_id section_lmh descending days_out; 
if first.event_id then closing_price=overall_avg_price;
if last.event_id then opening_price=overall_avg_price;
run;



/*merge all the first and last files in KIRI*/
data kiri;
set high_class;
run;
proc append base=kiri data=low_class;
run;
proc append base=kiri data=med_class;
run;




/*calculating the daily returns for each class and each game seperately- we are missing the first 2 and the last observation*/

proc sort data=high_class ;
by event_id descending days_out;
run;
data high_class;
set high_class;
by event_id;
if first.event_id and last.event_id 
	then delete;
	retain overall_avg_price event_id days_out;
if event_id >0
	then do; 
		lag_p=lag(overall_avg_price);
		ret=(lag_p- overall_avg_price)/(overall_avg_price)*100;
	end;
if first.event_id then delete;
run;
/**/
proc sort data=med_class ;
by event_id descending days_out;
run;

data med_class;
set med_class;
by event_id;
if first.event_id and last.event_id 
	then delete;
	retain overall_avg_price event_id days_out;
if event_id >0
	then do; 
		lag_p=lag(overall_avg_price);
		ret=(lag_p- overall_avg_price)/(overall_avg_price)*100;
	end;
if first.event_id then delete;
run;
/**/
proc sort data=low_class ;
by event_id descending days_out;
run;
data low_class;
set low_class;
by event_id;
if first.event_id and last.event_id 
	then delete;
	retain overall_avg_price event_id days_out;
if event_id >0
	then do; 
		lag_p=lag(overall_avg_price);
		ret=(lag_p- overall_avg_price)/(overall_avg_price)*100;
	end;
if first.event_id then delete;
run;
/*merging the daily return tables*/

proc append base=high_class data=low_class;
run;
proc append base=high_class data=med_class;
run;
proc sort data=high_class;
by event_id section_lmh descending days_out;
run;
/*creating two seprate list and then merging to later on joining them*/
data closing_price_list;
set kiri;
if closing_price=. then delete;
drop opening_price;
run;

data opening_price_list;
set kiri;
if opening_price=. then delete;
drop closing_price;
run;
/*data final_price;
	set closing_price_list opening_price_list;
   merge closing_price_list opening_price_list;
   by event_id section_lmh;
   run;
run;*/




proc export data=high_class
outfile='C:\Users\Benyamin\Dropbox\Ticket research\sexy_returns.csv'
dbms=csv
replace;
run;

proc export data=opening_price_list
outfile='C:\Users\Benyamin\Dropbox\Ticket research\opening_price_list.csv'
dbms=csv
replace;
run;
proc export data=closing_price_list
outfile='C:\Users\Benyamin\Dropbox\Ticket research\closing_price_list.csv'
dbms=csv
replace;
run;
