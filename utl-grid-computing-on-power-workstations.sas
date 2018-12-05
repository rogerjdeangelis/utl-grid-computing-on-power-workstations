Grid computing on power workstations

github
https://github.com/rogerjdeangelis/utl-grid-computing-on-power-workstations

Some of the new realtively inexpensive AMD Ryzen chips have 16 cores and 32 threads at 5z;

Ryzen
https://tinyurl.com/y7jk9qax
https://hothardware.com/news/amd-ryzen-3000-zen-2-cpus-rumor-16-cores-51ghz-boost-clock

"Finally, a new tier is being launched to take over the high end of the Ryzen family
(just as Intel did with the Core i9). In this case, we'll have the Ryzen 9 3800X and
Ryzen 9 3850X, both featuring 16 cores and 32 threads.
Read more at https://hothardware.com/news/amd-ryzen-3000-zen-2-cpus-rumor-16-cores-
51ghz-boost-clock#kQSolISEQiy0dqwR.99"

SAS Server Grid computing is sometimes throttle at 12 grid jobs.

With mutiple RAID 0 arrays and perhaps PCIE SSDs plus a storage appliance or SPDE.
The workstation can outperform the server. I have noticed a pick up
in open source storage appliance.

see
https://tinyurl.com/y7gr7kew
https://github.com/rogerjdeangelis/utl_parallell_processing_creating_8_subsets

and

https://tinyurl.com/y7a6rk5g
https://github.com/rogerjdeangelis?utf8=%E2%9C%93&tab=repositories&q=parallel+in%3Aname&type=&language=

https://tinyurl.com/y98kw5po
https://communities.sas.com/t5/SAS-Programming/how-do-i-rsubmit-to-specific-grid-nodes/m-p/518862

*                               _
  _____  ____ _ _ __ ___  _ __ | | ___
 / _ \ \/ / _` | '_ ` _ \| '_ \| |/ _ \
|  __/>  < (_| | | | | | | |_) | |  __/
 \___/_/\_\__,_|_| |_| |_| .__/|_|\___|
                         |_|
;

%let _s=%sysfunc(compbl(C:\Progra~1\SASHome\SASFoundation\9.4\sas.exe -sysin c:\nul
  -sasautos c:\oto -autoexec c:\oto\Tut_Oto.sas -work d:\wrk));

* this places the macro in my autocall library(c:/oto" so the batch command can find the macro;
* index on yyyy_qtr will speed this up;

data _null_;file "c:\oto\cutDat.sas" lrecl=512;input;put _infile_;putlog _infile_;
cards4;
%macro cutDat(yyyy_qtr);
   libname sd1 "d:/sd1";
   data sd1.out_&yyyy_qtr;
       set sd1.have(where=(yyyy_qtr="&yyyy_qtr."));
   run;quit;

%mend cutDat;
;;;;
run;quit;

%*cutDat(1991_1); * check interatively;

* set up
systask kill sys1 sys2 sys3 sys4  sys5 sys6 sys7 sys8;
systask command "&_s -termstmt %nrstr(%cutDat(1990_1);) -log d:\log\a1.log" taskname=sys1;
systask command "&_s -termstmt %nrstr(%cutDat(1990_2);) -log d:\log\a2.log" taskname=sys2;
systask command "&_s -termstmt %nrstr(%cutDat(1990_3);) -log d:\log\a3.log" taskname=sys3;
systask command "&_s -termstmt %nrstr(%cutDat(1990_4);) -log d:\log\a4.log" taskname=sys4;
systask command "&_s -termstmt %nrstr(%cutDat(1991_1);) -log d:\log\a5.log" taskname=sys5;
systask command "&_s -termstmt %nrstr(%cutDat(1991_2);) -log d:\log\a6.log" taskname=sys6;
systask command "&_s -termstmt %nrstr(%cutDat(1991_3);) -log d:\log\a87log" taskname=sys7;
systask command "&_s -termstmt %nrstr(%cutDat(1991_4);) -log d:\log\a8.log" taskname=sys8;
waitfor sys1 sys2 sys3 sys4  sys5 sys6 sys7 sys8;




