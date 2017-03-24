// $Rev: 65 $
// $Date: 2016-05-11 15:22:28 -0700 (Wed, 11 May 2016) $
// $LastChangedBy: jlperla $
capture program drop logall
program logall
	syntax varlist(min=1 numeric), Prefix(string)
	marksample touse
	
	foreach var in `varlist' {
		capture confirm numeric variable `prefix'`var' //checks if the variable is present
		if _rc { //Only if it doesn't exist
			gen `prefix'`var' = ln(`var')
			local lab: variable label `var'
			label variable `prefix'`var' "Log of `lab'"
		}
	}
end
