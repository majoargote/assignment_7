*******************************************************
*   OREOPOULOS (2006) – REPLICACIÓ
*******************************************************

clear all
set more off

cd "/Users/gal.lagelpibuxade/Desktop/Assignment7"
use assignment7.dta, clear

* ----------------------------------------------------
* 1. FILTRES EXACTES DEL PAPER
* ----------------------------------------------------

keep if missing_earn == 0
keep if agelfted <= 18
keep if age <= 60

replace datyear = . if datyear==0
keep if (datyear <= 98 & nireland==0) | (datyear <=99 & nireland==1)

* ----------------------------------------------------
* 2. CLUSTER = cohort × region
* ----------------------------------------------------
egen clust = group(yearat14 nireland)

* ----------------------------------------------------
* 3. MOSTRA GREAT BRITAIN
* ----------------------------------------------------
keep if nireland == 0

* ----------------------------------------------------
* 4. REGRESSIONS EXACTES PER TAULA 1
* ----------------------------------------------------
* NOTA IMPORTANT:
* outreg2 → NO funciona amb "outreg drop15 using..."
* Cal fer: outreg2 using file, keep(var)

*------------ COLUMNES 1–3 (FIRST STAGE) -------------*

xi: reg agelfted yearat14 yearat14_2 yearat14_3 yearat14_4 ///
        drop15 [fw=wght], cluster(clust)

outreg2 using table1.tex, replace tex ///
        keep(drop15) se bdec(3) bracket ctitle("agelfted")

xi: reg agelfted yearat14 yearat14_2 yearat14_3 yearat14_4 ///
        age age2 age3 age4 drop15 [fw=wght], cluster(clust)

outreg2 using table1.tex, append tex ///
        keep(drop15) se bdec(3) bracket ctitle("agelfted, Age Polynomial")

xi: reg agelfted yearat14 yearat14_2 yearat14_3 yearat14_4 ///
        i.age drop15 [fw=wght], cluster(clust)

outreg2 using table1.tex, append tex ///
        keep(drop15) se bdec(3) bracket ctitle("agelfted, Age Dummies")

*------------ COLUMNES 4–6 (REDUCED FORM) -------------*

xi: reg learn yearat14 yearat14_2 yearat14_3 yearat14_4 ///
        drop15 [fw=wght], cluster(clust)

outreg2 using table1.tex, append tex ///
        keep(drop15) se bdec(3) bracket ctitle("learn")

xi: reg learn yearat14 yearat14_2 yearat14_3 yearat14_4 ///
        age age2 age3 age4 drop15 [fw=wght], cluster(clust)

outreg2 using table1.tex, append tex ///
        keep(drop15) se bdec(3) bracket ctitle("learn, Age Polynomial")

xi: reg learn yearat14 yearat14_2 yearat14_3 yearat14_4 ///
        i.age drop15 [fw=wght], cluster(clust)

outreg2 using table1.tex, append tex ///
        keep(drop15) se bdec(3) bracket ctitle("learn, Age Dummies")

*******************************************************
*   END
*******************************************************
