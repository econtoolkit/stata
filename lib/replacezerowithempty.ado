// $Rev: 68 $
// $Date: 2016-05-20 16:50:35 -0700 (Fri, 20 May 2016) $
// $LastChangedBy: jlperla $

capture program drop replacezerowithempty    
program replacezerowithempty
	syntax varlist(min=1 numeric)
	foreach var in `varlist' {
		replace `var' = . if `var' == 0
	}

end
