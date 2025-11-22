log using "analysis 2008 08 21.log", replace

*STEP 5: produce tables

*use "combined\ghhs cell means.dta", clear

cd "/Users/gal.lagelpibuxade/Desktop/Assignment7"
use assignment7.dta, clear

egen clust = group(yearat14 nireland)



*****************************
*keep if agelfted<=18
*keep if age<=60
*keep if (datyear<=98 & nireland==0) | (datyear<=99 & nireland==1)  
*****************************
  


* tables 1 and 2

xi: reg agelfted yearat14 yearat14_2 yearat14_3 yearat14_4 drop15 if nireland== 0 & missing_earn==0 [fw=wght], cluster(clust)
outreg drop15 using table1, replace bdec(3) se bracket 3aster ctitle("britain poly=3")
xi: reg agelfted yearat14 yearat14_2 yearat14_3 yearat14_4 age age2 age3 age4 drop15 if nireland== 0 & missing_earn==0 [fw=wght], cluster(clust)
outreg drop15 using table1, append bdec(3) se bracket 3aster ctitle("britain poly=4")
xi: reg agelfted yearat14 yearat14_2 yearat14_3 yearat14_4 i.age drop15 if nireland== 0 & missing_earn==0 [fw=wght], cluster(clust)
outreg drop15 using table1, append bdec(3) se bracket 3aster ctitle("britain poly=4 age")

xi: reg learn yearat14 yearat14_2 yearat14_3 yearat14_4 drop15 if nireland== 0 & missing_earn==0 [fw=wght], cluster(clust)
outreg drop15 using table1, append bdec(3) se bracket 3aster ctitle("britain poly=3")
xi: reg learn yearat14 yearat14_2 yearat14_3 yearat14_4 age age2 age3 age4 drop15 if nireland== 0 & missing_earn==0 [fw=wght], cluster(clust)
outreg drop15 using table1, append bdec(3) se bracket 3aster ctitle("britain poly=4")
xi: reg learn yearat14 yearat14_2 yearat14_3 yearat14_4 i.age drop15 if nireland== 0 & missing_earn==0 [fw=wght], cluster(clust)
outreg drop15 using table1, append bdec(3) se bracket 3aster ctitle("britain poly=4 age")

xi: ivreg learn yearat14 yearat14_2 yearat14_3 yearat14_4 (agelfted=drop15) if nireland== 0 & missing_earn==0 [fw=wght], cluster(clust)
outreg agelfted using table1, append bdec(3) se bracket 3aster ctitle("iv britain poly=3")
xi: ivreg learn yearat14 yearat14_2 yearat14_3 yearat14_4 age age2 age3 age4 (agelfted=drop15) if nireland== 0 & missing_earn==0 [fw=wght], cluster(clust)
outreg agelfted using table1, append bdec(3) se bracket 3aster ctitle("iv britain poly=4")
xi: ivreg learn yearat14 yearat14_2 yearat14_3 yearat14_4 i.age (agelfted=drop15) if nireland== 0 & missing_earn==0  [fw=wght], cluster(clust)
outreg agelfted using table1, append bdec(3) se bracket 3aster ctitle("iv britain poly=4 age")

xi: reg agelfted yearat14 yearat14_2 yearat14_3 yearat14_4 drop15 if nireland== 1 & missing_earn==0 [fw=wght], cluster(clust)
outreg drop15 using table2, replace bdec(3) se bracket 3aster ctitle("britain poly=3")
xi: reg agelfted yearat14 yearat14_2 yearat14_3 yearat14_4 age age2 age3 age4 drop15 if nireland== 1 & missing_earn==0 [fw=wght], cluster(clust)
outreg drop15 using table2, append bdec(3) se bracket 3aster ctitle("britain poly=4")
xi: reg agelfted yearat14 yearat14_2 yearat14_3 yearat14_4 i.age drop15 if nireland== 1 & missing_earn==0 [fw=wght], cluster(clust)
outreg drop15 using table2, append bdec(3) se bracket 3aster ctitle("britain poly=4 age")

xi: reg learn yearat14 yearat14_2 yearat14_3 yearat14_4 drop15 if nireland== 1 & missing_earn==0 [fw=wght], cluster(clust)
outreg drop15 using table2, append bdec(3) se bracket 3aster ctitle("britain poly=3")
xi: reg learn yearat14 yearat14_2 yearat14_3 yearat14_4 age age2 age3 age4 drop15 if nireland== 1 & missing_earn==0 [fw=wght], cluster(clust)
outreg drop15 using table2, append bdec(3) se bracket 3aster ctitle("britain poly=4")
xi: reg learn yearat14 yearat14_2 yearat14_3 yearat14_4 i.age drop15 if nireland== 1 & missing_earn==0 [fw=wght], cluster(clust)
outreg drop15 using table2, append bdec(3) se bracket 3aster ctitle("britain poly=4 age")

xi: ivreg learn yearat14 yearat14_2 yearat14_3 yearat14_4 (agelfted=drop15) if nireland== 1 & missing_earn==0 [fw=wght], cluster(clust)
outreg agelfted using table2, append bdec(3) se bracket 3aster ctitle("iv britain poly=3")
xi: ivreg learn yearat14 yearat14_2 yearat14_3 yearat14_4 age age2 age3 age4 (agelfted=drop15) if nireland== 1 & missing_earn==0 [fw=wght], cluster(clust)
outreg agelfted using table2, append bdec(3) se bracket 3aster ctitle("iv britain poly=4")
xi: ivreg learn yearat14 yearat14_2 yearat14_3 yearat14_4 i.age (agelfted=drop15) if nireland== 1 & missing_earn==0  [fw=wght], cluster(clust)
outreg agelfted using table2, append bdec(3) se bracket 3aster ctitle("iv britain poly=4 age")

xi: reg agelfted yearat14 yearat14_2 yearat14_3 yearat14_4 drop15 nireland  if missing_earn==0  [fw=wght], cluster(clust)
outreg drop15 using table3, replace bdec(3) se bracket 3aster ctitle("britain poly=3")
xi: reg agelfted yearat14 yearat14_2 yearat14_3 yearat14_4 age age2 age3 age4 drop15 nireland if missing_earn==0 [fw=wght], cluster(clust)
outreg drop15 using table3, append bdec(3) se bracket 3aster ctitle("britain poly=4")
xi: reg agelfted yearat14 yearat14_2 yearat14_3 yearat14_4 i.age drop15 nireland if missing_earn==0 [fw=wght], cluster(clust)
outreg drop15 using table3, append bdec(3) se bracket 3aster ctitle("britain poly=4 age")

xi: reg learn yearat14 yearat14_2 yearat14_3 yearat14_4 drop15 nireland  if missing_earn==0 [fw=wght], cluster(clust)
outreg drop15 using table3, append bdec(3) se bracket 3aster ctitle("britain poly=3")
xi: reg learn yearat14 yearat14_2 yearat14_3 yearat14_4 age age2 age3 age4 drop15 nireland  if missing_earn==0 [fw=wght], cluster(clust)
outreg drop15 using table3, append bdec(3) se bracket 3aster ctitle("britain poly=4")
xi: reg learn yearat14 yearat14_2 yearat14_3 yearat14_4 i.age drop15 nireland  if missing_earn==0 [fw=wght], cluster(clust)
outreg drop15 using table3, append bdec(3) se bracket 3aster ctitle("britain poly=4 age")

xi: ivreg learn yearat14 yearat14_2 yearat14_3 yearat14_4 (agelfted=drop15) nireland  if missing_earn==0 [fw=wght], cluster(clust)
outreg agelfted using table3, append bdec(3) se bracket 3aster ctitle("iv britain poly=3")
xi: ivreg learn yearat14 yearat14_2 yearat14_3 yearat14_4 age age2 age3 age4 (agelfted=drop15) nireland  if missing_earn==0 [fw=wght], cluster(clust)
outreg agelfted using table3, append bdec(3) se bracket 3aster ctitle("iv britain poly=4")
xi: ivreg learn yearat14 yearat14_2 yearat14_3 yearat14_4 i.age (agelfted=drop15) nireland  if missing_earn==0 [fw=wght], cluster(clust)
outreg agelfted using table3, append bdec(3) se bracket 3aster ctitle("iv britain poly=4 age")
