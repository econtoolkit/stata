// $Rev: 78 $
// $Date: 2016-05-30 21:37:35 -0700 (Mon, 30 May 2016) $
// $LastChangedBy: jlperla $

capture program drop demean
program demean
	syntax varlist(min=1 numeric), Prefix(string)

	foreach var in `varlist' {
		capture confirm numeric variable `prefix'`var' //checks if the variable is present
		if _rc { //Only if it doesn't exist
			bysort `_dta[iis]': egen mean`var'=mean(`var')
			gen `prefix'`var'=`var'-mean`var'
			
			local lab: variable label `var'
			label variable `prefix'`var' "Demeaned `lab'"
			drop mean`var'
		}
	}
end
