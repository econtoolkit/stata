// $Rev: 99 $
// $Date: 2016-12-21 10:49:38 -0800 (Wed, 21 Dec 2016) $
// $LastChangedBy: jlperla $

capture program drop censortoempty    
program censortoempty
	syntax varlist(min=1 numeric), Minvalue(real) Maxvalue(real)
	foreach var in `varlist' {
		replace `var' = . if `var' < `minvalue' | `var' > `maxvalue'
	}
end
