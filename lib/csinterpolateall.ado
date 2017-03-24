// $Rev: 76 $
// $Date: 2016-05-30 15:45:24 -0700 (Mon, 30 May 2016) $
// $LastChangedBy: jlperla $
capture program drop csinterpolateall
program csinterpolateall
	syntax varlist(min=1), Prefix(string)
	marksample touse
	
	foreach var in `varlist' {
		by `_dta[iis]': csipolate `var' `_dta[tis]', gen(`prefix'`var') //Requires panel
		local lab: variable label `var'
		label variable `prefix'`var' "Interpolated `lab'"
	}
end
