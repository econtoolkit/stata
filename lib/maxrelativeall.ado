// $Rev: 76 $
// $Date: 2016-05-30 15:45:24 -0700 (Mon, 30 May 2016) $
// $LastChangedBy: jlperla $
capture program drop maxrelativeall
program maxrelativeall
	syntax varlist(min=1), Prefix(string) Relativeprefix(string) Maxperiodprefix(string)
	marksample touse
	
	foreach var in `varlist' {
		local lab: variable label `var'
		bysort `_dta[iis]': egen `prefix'`var' = max(`var')
		label variable `prefix'`var' "Max `lab'"
		
		bysort `_dta[iis]': gen `relativeprefix'`var' = `var' /`prefix'`var'
		label variable  `relativeprefix'`var' "Relative to max of `lab'"

		bysort `_dta[iis]': gen `maxperiodprefix'`var' = year if `relativeprefix'`var' >= 1.0 & !missing(`relativeprefix'`var')
		bysort `_dta[iis]' (`maxperiodprefix'`var') : replace `maxperiodprefix'`var' = `maxperiodprefix'`var'[1] //Copies throughout, sorted
		label variable  `maxperiodprefix'`var' "Period relative to max of `lab'"		
	}
end
