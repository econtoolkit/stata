// $Rev: 65 $
// $Date: 2016-05-11 15:22:28 -0700 (Wed, 11 May 2016) $
// $LastChangedBy: jlperla $
capture program drop percentchange
program percentchange
	syntax varlist(min=1 numeric), Prefix(string) Logprefix(string)
	marksample touse
	
	logall `varlist', prefix(`logprefix') //First makes sure there are l... for all variables

	foreach var in `varlist' {
		capture confirm numeric variable `prefix'`var' //checks if the variable is present
		if _rc { //Only if it doesn't exist
			gen timelag = D.`_dta[tis]' //Don't want to have percentage changes due to dropped data
			gen `prefix'`var' = D.`logprefix'`var'
			replace `prefix'`var' = . if timelag > 1 //Filters out changes of percentages that occur over multiple years due to missing data.
			
			local lab: variable label `var'
			label variable `prefix'`var' "Percent Change of `lab'"
			drop timelag
		}
	}
end
