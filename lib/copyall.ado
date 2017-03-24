// $Rev: 74 $
// $Date: 2016-05-27 14:28:54 -0700 (Fri, 27 May 2016) $
// $LastChangedBy: jlperla $
capture program drop copyall
program copyall
	syntax varlist(min=1), Prefix(string) [Labelprefix(string)]
	foreach var in `varlist' {
		gen `prefix'`var' = `var'
		local templabel : variable label `var'		
		label variable `prefix'`var' "`labelprefix'`templabel'"
	}
end
